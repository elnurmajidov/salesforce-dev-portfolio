public class LeadsCleanupBatch implements Database.Batchable<sObject> {

    public Database.QueryLocator start(Database.BatchableContext bc){
        String openStatus = 'Open - Not Contacted';
        String query = 'SELECT Id, LeadSource, status, FirstName, LastName, Company, OwnerId FROM lead WHERE LeadSource = NULL AND Status = :openStatus';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Lead>scope){
        List<Task> tasks = new List<Task>();
        for(Lead lead : scope){
                lead.LeadSource = 'Trade Show 2026';

                //Create Initial Outreach Task
                Task tsk = new Task(
                    Subject = 'Initial Outreach: ' + lead.FirstName + '' + lead.LastName,
                    OwnerId = lead.OwnerId,
                    Description = 'Call the prospect and explain the details.',
                    ActivityDate = Date.today().addDays(3),
                    WhoId = lead.Id,
                    Status = 'Not Started'
                );
                tasks.add(tsk);
        }
        try{
            update scope;
            insert tasks; 
        }catch(Exception ex){
            System.debug(ex.getMessage());
        }
    }

    public void finish(Database.BatchableContext bc){

    }
}