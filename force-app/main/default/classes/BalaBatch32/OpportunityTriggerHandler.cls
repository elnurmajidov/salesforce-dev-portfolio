public class OpportunityTriggerHandler {

    public static void beforeInsert(List<Opportunity> newOpps){
        Map<String,Decimal> slaVsDiscount = getDiscountSettings();
        Map<Id,String> accountIdVsSla = getAccountSlas(newOpps);

        //Iterate over new opps and calculate discount amount
        for(Opportunity opp : newOpps){
            String sla = accountIdVsSla.get(opp.AccountId);
            Decimal discount = slaVsDiscount.get(sla);
            opp.Discounted_Amount__c = (opp.Amount*discount)/100;
            opp.Description = Label.Discount_Message.replace('{discount}', String.valueOf(discount));

        }
    }

    //Get the account sla. Account Id Vs SLA
    private static Map<Id,String> getAccountSlas(List<Opportunity> newOpps){
        Map<Id,String> accountIdVsSla = new Map<Id,String>();

        //Collect Account IDs
        Set<Id> accountIds = new Set<Id>();
        for(Opportunity opp : newOpps){
            accountIds.add(opp.AccountId);
        }

        //Prepare Account Id Vs SLA
        for(Account acc : [SELECT Id, SLA__c FROM Account WHERE Id IN :accountIds]){
            accountIdVsSla.put(acc.Id, acc.SLA__c);
        }
        return accountIdVsSla;
    }

    //Get the discount settings. SLA Vs Discount
    private static Map<String,Decimal> getDiscountSettings(){
        Map<String,Decimal> slaVsDiscount = new Map<String,Decimal>();
        for(Discount_Setting__mdt setting  : Discount_Setting__mdt.getAll().values()){
            slaVsDiscount.put(setting.MasterLabel, setting.Discount__c);
        }
        return slaVsDiscount;
    }
}