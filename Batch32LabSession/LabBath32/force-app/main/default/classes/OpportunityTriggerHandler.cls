public  class OpportunityTriggerHandler {
// Question 1 :
// Create some custom fields
// a. 'Target Amount' - Field Type: Currency
// b. 'Total Amount Generated' - Field Type: Currency
// c. 'Highest Amount Opportunity Name' - Field Type: Text
// d. 'Target Amount Achieved Opportunity Name' - Field Type: Text
// on Account Object.
// Create methods which takes in the set of Account Ids (or any other required parameter) and do the
// following tasks:
// A. Update the "Highest Amount Opportunity Name" field at Account level with the
// opportunity Name which has the Highest amount among the opportunities related to
// the account.
// B. Update the 'Target Amount Achieved Opportunity Name' at Account level with the
// Closed Won Opportunity Name. Populate the opportunity name which has the highest
// value in the Amount field, and it should be more than the 'Target Amount' field value at
// account.
// C. Update the 'Total Amount Generated' at Account with the total of Amount for all the
// closed Won Opportunities related to an Account.
// Please Note: Above updates should happen whenever any of the following event occurs:
// i. Amount field is Updated at Opportunity level.
// ii. Opportunity stageName is changed.
// iii. Opportunity is reparented i.e AccountId field value is changed.
// iv. A new Opportunity is created and tagged to an account.
// v. An Opportunity is deleted or undeleted
    public static void insertOpportunity(List<Opportunity> TriggerNew){
        Set<Id> accIds = new Set<Id>();

        for (Opportunity opp : TriggerNew) {
            if (opp.AccountId != null && opp.Amount != null) {
                accIds.add(opp.AccountId);
            }

        }
        if (!accIds.isEmpty()) {
            highestOppName(accIds);
            targetAmountAchievedOppName(accIds);
            totalAmountGenerated(accIds);
        }

    }
    public static void updateAcct (List<Opportunity> triggerNew, Map<Id,Opportunity> oldMap) {
        Set<Id> accIds = new Set<Id>();
        for (Opportunity opp : triggerNew) {
            Opportunity oldOpp = oldMap.get(opp.Id);

            if(opp.Amount != oldOpp.Amount || opp.StageName != oldOpp.StageName || opp.AccountId != oldOpp.AccountId) {
                accIds.add(oldOpp.AccountId);
                accIds.add(opp.AccountId);
            }
        }
        if(!accIds.isEmpty()) {
            highestOppName(accIds);
             targetAmountAchievedOppName(accIds);
             totalAmountGenerated(accIds);
        }
    }
    public static void deleteOpp (List<Opportunity> triggerOld) {
        Set<Id> accIds = new Set<Id>();
        for (Opportunity opp : triggerOld) {
            if(opp.AccountId != null && opp.Amount != null) {
                accIds.add(opp.AccountId);
            }
        }
        if(!accIds.isEmpty()) {
            highestOppName(accIds);
             targetAmountAchievedOppName(accIds);
             totalAmountGenerated(accIds);
        }
    }
//     A. Update the "Highest Amount Opportunity Name" field at Account level with the
// // opportunity Name which has the Highest amount among the opportunities related to
// // the account.
    public static void highestOppName(Set<Id> accIds){

        List<Account> accList = [Select id,(Select id, name from Opportunities where Amount != null order by amount desc limit 1) from Account where Id IN : accIds ];

        for (Account acc : accList) {
            if (acc.Opportunities.size() > 0 ) {
                acc.Highest_Amount_Opportunity_Name__c= acc.Opportunities[0].Name;

            }else {
                acc.Highest_Amount_Opportunity_Name__c = null;
            }

        }
        if (!accList.isEmpty()) {
            update accList;

        }
    }
    //B. Update the 'Target Amount Achieved Opportunity Name' at Account level with the
// Closed Won Opportunity Name. Populate the opportunity name which has the highest
// value in the Amount field, and it should be more than the 'Target Amount' field value at
// account.
    public static void targetAmountAchievedOppName(set<id> accIds){
        List<Account> accList = [Select id,Target_Amount__c,(Select id, name,amount from Opportunities where Amount != null and StageName = 'Closed Won' order by amount desc limit 1) from Account where Id IN : accIds ];

        for (Account acc : accList) {
            if (acc.Opportunities.size() > 0 && acc.Target_Amount__c < acc.Opportunities[0].Amount) {
                acc.Target_Amount_Achieved_Opportunity_Name__c= acc.Opportunities[0].Name;

            }else {
                acc.Target_Amount_Achieved_Opportunity_Name__c = null;
            }

        }
        if (!accList.isEmpty()) {
            update accList;

        }

    }

    // C. Update the 'Total Amount Generated' at Account with the total of Amount for all the
// closed Won Opportunities related to an Account.
    public static void totalAmountGenerated(set<id> accIds){
        List<Account> accList = [Select id,(Select id, name,amount from Opportunities where Amount != null and StageName = 'Closed Won'  ) from Account where Id IN : accIds ];

        for (Account acc : accList) {
            decimal totalAmount = 0;
            for(opportunity opp: acc.Opportunities){
                totalAmount += opp.Amount;
            } 
            acc.Total_Amount_Generated__c = totalAmount;        
            
        }
        if (!accList.isEmpty()) {
            update accList;

        }



    }
 


}