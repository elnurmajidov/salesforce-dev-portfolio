public class VIPServiceHandler {
    public static Map<String,Decimal> getVIPRules(){
        List<VIPRule__mdt> rules = VIPRule__mdt.getAll().values();
        //Banking => 50000000;
        //Energy=>10000000;
        Map<String,Decimal> rulesMap  = new Map<String,Decimal>();
        
        for(VIPRule__mdt rule : rules){
            rulesMap.put(rule.Industry__c,rule.MinimumRevenue__c);
        }
        return rulesMap; 
    }
    
    public static void checkRulesAndProcess(List<Account> triggerNew, Map<Id,Account> triggerOldMap){
        Map<String,Decimal> vipRules = getVIPRules();
        Set<Id> vipIds = new Set<Id>();

        for(Account acc : triggerNew){
            Account oldAcc = triggerOldMap.get(acc.Id);
            Boolean isChanged = (acc.Industry != oldAcc.Industry && acc.Industry != null) || (acc.AnnualRevenue != oldAcc.AnnualRevenue && acc.AnnualRevenue != null);
            if(isChanged){
                if(vipRules.containsKey(acc.Industry)){
                     if(acc.AnnualRevenue >= vipRules.get(acc.Industry)){
                        vipIds.add(acc.Id);
                    }
                }   
            }
        }
        
        if(!vipIds.isEmpty()){
            //----------Queueable cağıracağız
            System.enqueueJob(new VIPAccountQueueable(vipIds));
        }
        
        
        
    }
    
    
}