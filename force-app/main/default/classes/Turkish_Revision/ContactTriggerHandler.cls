public with sharing class ContactTriggerHandler {
    // Contact recordunun bağlı oldugu bir account varsa tespit et ve bu accountun contact sayılarını hesapla
    public static void insertUndeleteMethod(List<Contact> newTrigger){
        Set<Id> accIds = new Set<Id>();

        for(Contact con : newTrigger){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }

        if(!accIds.isEmpty()){
          calculateNumberOfContacts(accIds);
        }
    }

    public static void updateMethod(List<Contact> newTrigger, Map<Id,Contact> oldMap){

        Set<Id> accIds = new Set<Id>();
        for(Contact con : newTrigger){
            Contact oldContact = oldMap.get(con.Id);
            if(con.AccountId != oldContact.AccountId){
                accIds.add(con.AccountId);
                accIds.add(oldContact.AccountId);
            }
        }

        if(!accIds.isEmpty()){
             calculateNumberOfContacts(accIds);
        }
        
    }

    public static void deleteMethod(List<Contact> oldTrigger){
        Set<Id> accIds = new Set<Id>();
        for(Contact con : oldTrigger){
            if(con.AccountId != null){
                accIds.add(con.AccountId);
            }
        }

        if(!accIds.isEmpty()){
            calculateNumberOfContacts(accIds);
        }
    }

    public static void calculateNumberOfContacts(Set<Id> accIds){
        List<Account> accounts = [SELECT Id,(SELECT Id FROM Contacts) FROM Account WHERE Id In : accIds];

            for(Account acc : accounts){
                acc.Number_Of_Contacts__c = acc.Contacts.size();
            }

            if(!accounts.isEmpty()){
                update accounts;
            }
    }

}