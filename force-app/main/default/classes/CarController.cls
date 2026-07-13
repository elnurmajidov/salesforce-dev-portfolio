public with sharing class CarController {
    @AuraEnabled(cacheable=true)
    public static List<Car__c> getCars(String category) {
        if (String.isBlank(category) || category == 'All') {
            return [
                SELECT Id, Name, Category__c, Make__c, Price__c, Picture_URL__c
                FROM Car__c
                ORDER BY Name
            ];
        }
        return [
            SELECT Id, Name, Category__c, Make__c, Price__c, Picture_URL__c
            FROM Car__c
            WHERE Category__c = :category
            ORDER BY Name
        ];
    }
}
