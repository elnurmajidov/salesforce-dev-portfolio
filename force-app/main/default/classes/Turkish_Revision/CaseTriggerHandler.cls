public with sharing class CaseTriggerHandler {
    public static void updateRelatedAccount(List<Case> triggerNew){

        List<Account> accounts = new List<Account>();
        for(Case cs : triggerNew){
            if(cs.Status == 'Closed' && cs.AccountId != null){
                Account acc = new Account();
                acc.Id = cs.accountId;
                acc.Last_Support_Date__c = Date.today();
                accounts.add(acc);
            }
        }

        if(!accounts.isEmpty()){
            update accounts;
        }

    }
}