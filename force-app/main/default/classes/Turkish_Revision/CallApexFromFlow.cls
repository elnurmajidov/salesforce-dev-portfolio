public with sharing class CallApexFromFlow {
    @InvocableMethod(label='Delete Child Opps' description='Delete related opps' category='Opportunity')
    public static void deleteChildOpps(List<Id> accIds) {

        List<opportunity> oppToDelete =[ 
            SELECT Id 
            from Opportunity
            Where AccountId In: accIds
        ];
        if(oppToDelete.size()>0){
            delete oppToDelete;
        }
    }
}