public class OpportunityDetail {
    public static void totalAmounts(){
        List<account> listAcc = [SELECT Id, Name, (SELECT Id, Name, Amount FROM Opportunities) FROM Account];
        Map<Id, Decimal> accountTotalAmountMap = new Map<Id, Decimal>();
        
        for (Account eachAcc : listAcc) {
            System.debug(' for dongusu start');
            System.debug('Account ismi => ' + eachAcc.name);
            List<Opportunity> listOpp = eachAcc.Opportunities;
            if(!listOpp.isEmpty()){
                Decimal total = 0;
                for(Opportunity eachOpp : listOpp){
                    total += eachOpp.Amount;
                }
                accountTotalAmountMap.put(eachAcc.id, total);
            }
            System.debug('for dongusu finish');
        }
        System.debug('Accountlara bagli olan opportunitylerin amount toplamlari Map = ' + accountTotalAmountMap);
    }
}