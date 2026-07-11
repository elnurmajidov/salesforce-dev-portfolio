public class DeleteClosedLostOpportunitiesBatch implements Database.Batchable<sObject>, Database.Stateful {
        public integer opportunityDeletedSize = 0;

        public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id, StageName FROM Opportunity WHERE StageName = 'Closed Lost' ]);
    }
    
        public void execute(Database.BatchableContext BC, List<Opportunity> scope){

        delete scope;
        opportunityDeletedSize += scope.size();
    }
    
    public void finish(Database.BatchableContext BC) {
        System.debug('Process Completed!');
        System.debug('Total Deleted Opportunity => ' + opportunityDeletedSize);
    }
    
}