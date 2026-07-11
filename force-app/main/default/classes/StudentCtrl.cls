public with sharing class StudentCtrl {
    @AuraEnabled
    public static List <Student__c> searchStudent(String PostalCode) {
        if(String.isBlank(PostalCode)){
            return new List<Student__c>();
        }

        String searchKey = '%'  + PostalCode + '%';
        return [SELECT id, Postal_Code__c FROM Student__c WHERE Postal_Code__c LIKE :searchKey];
    }
}