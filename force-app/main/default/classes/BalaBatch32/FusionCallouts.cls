public with sharing class FusionCallouts {

    @AuraEnabled(cacheable=true)
    public static string getMenuItems() {
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://www.themealdb.com/api/json/v1/1/categories.php');

        Http http = new Http();
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            return response.getBody();
        }
        return '';
    }

    @AuraEnabled(cacheable=true)
    public static string getFoodItemsByMenu(string category){
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://www.themealdb.com/api/json/v1/1/filter.php?c=' + category);

        Http http = new Http();
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            return response.getBody();
        }
        return '';
    }

    @AuraEnabled(cacheable=true)
    public static string getRecipeDetails(string foodItemId){
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://www.themealdb.com/api/json/v1/1/lookup.php?i=52772' + foodItemId);

        Http http = new Http();
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            return response.getBody();
        }
        return '';

    }
}