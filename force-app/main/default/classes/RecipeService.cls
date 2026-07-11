public with sharing class RecipeService {
    private static final String ENDPOINT = 'https://dummyjson.com/recipes?limit=10&select=id,name,ingredients,instructions,cookTimeMinutes,servings,tags,caloriesPerServing,image';

    @future(callout=true)
    public static void syncRecipesAsync() {
        syncRecipes();
    }

    public static void syncRecipes() {
        HttpRequest request = new HttpRequest();
        request.setEndpoint(ENDPOINT);
        request.setMethod('GET');

        HttpResponse response = new Http().send(request);
        if (response.getStatusCode() != 200) {
            throw new RecipeServiceException('Recipe callout failed. Status: ' + response.getStatus() + ', Body: ' + response.getBody());
        }

        RecipeResponse wrapper = (RecipeResponse) JSON.deserialize(response.getBody(), RecipeResponse.class);
        if (wrapper == null || wrapper.recipes == null || wrapper.recipes.isEmpty()) {
            return;
        }

        List<Recipe__c> recipes = new List<Recipe__c>();
        for (ApiRecipe apiRecipe : wrapper.recipes) {
            recipes.add(new Recipe__c(
                Name = apiRecipe.name,
                Recipe_ID__c = String.valueOf(apiRecipe.id),
                Instructions__c = joinList(apiRecipe.instructions),
                Cook_Time_Minutes__c = apiRecipe.cookTimeMinutes,
                Servings__c = apiRecipe.servings,
                Tags__c = joinList(apiRecipe.tags),
                Ingredients__c = joinList(apiRecipe.ingredients),
                Calories_Per_Serving__c = apiRecipe.caloriesPerServing,
                Recipe_Image__c = apiRecipe.image
            ));
        }

        upsert recipes Recipe_ID__c;
    }

    private static String joinList(List<String> values) {
        return values == null ? null : String.join(values, '\n');
    }

    public class RecipeResponse {
        public List<ApiRecipe> recipes;
    }

    public class RecipeServiceException extends Exception {}

    public class ApiRecipe {
        public Integer id;
        public String name;
        public List<String> ingredients;
        public List<String> instructions;
        public Integer cookTimeMinutes;
        public Integer servings;
        public List<String> tags;
        public Integer caloriesPerServing;
        public String image;
    }
}
