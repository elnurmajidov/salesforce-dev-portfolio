@IsTest
private class RecipeServiceTest {
    private class RecipeMock implements HttpCalloutMock {
        public HttpResponse respond(HttpRequest request) {
            HttpResponse response = new HttpResponse();
            response.setStatusCode(200);
            response.setHeader('Content-Type', 'application/json');
            response.setBody('{"recipes":[{"id":101,"name":"Test Pasta","ingredients":["Noodles","Salt"],"instructions":["Boil water","Cook noodles"],"cookTimeMinutes":12,"servings":2,"tags":["Pasta","Test"],"caloriesPerServing":410,"image":"https://cdn.dummyjson.com/recipe-images/10.webp"}]}');
            return response;
        }
    }

    @IsTest
    static void syncRecipesCreatesRecords() {
        Test.setMock(HttpCalloutMock.class, new RecipeMock());

        Test.startTest();
        RecipeService.syncRecipes();
        Test.stopTest();

        Recipe__c recipe = [
            SELECT Name, Recipe_ID__c, Ingredients__c, Instructions__c, Cook_Time_Minutes__c,
                Servings__c, Tags__c, Calories_Per_Serving__c, Recipe_Image__c
            FROM Recipe__c
            WHERE Recipe_ID__c = '101'
            LIMIT 1
        ];

        System.assertEquals('Test Pasta', recipe.Name);
        System.assertEquals('101', recipe.Recipe_ID__c);
        System.assert(recipe.Ingredients__c.contains('Noodles'));
        System.assert(recipe.Instructions__c.contains('Cook noodles'));
        System.assertEquals(12, recipe.Cook_Time_Minutes__c.intValue());
        System.assertEquals(2, recipe.Servings__c.intValue());
        System.assert(recipe.Tags__c.contains('Pasta'));
        System.assertEquals(410, recipe.Calories_Per_Serving__c.intValue());
        System.assertEquals('https://cdn.dummyjson.com/recipe-images/10.webp', recipe.Recipe_Image__c);
    }
}
