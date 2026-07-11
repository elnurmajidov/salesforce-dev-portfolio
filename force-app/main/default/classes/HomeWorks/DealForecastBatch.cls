public with sharing class DealForecastBatch implements Database.Batchable<sObject>, Database.Stateful {

    
    private Decimal closedWonAmount;
    private Decimal pipelineAmount;

    public DealForecastBatch() {
        closedWonAmount = 0;
        pipelineAmount = 0;
    }

    public Database.QueryLocator start(Database.BatchableContext bc) { // Total Records: 1,000; Batch Size: 200
        String query = 'SELECT StageName, CloseDate, Amount, IsClosed FROM Opportunity WHERE  CloseDate = THIS_MONTH';
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> opps) { // Executions/Txns = 1,000/200 = 5
        // Aggregate the amounts
        for(Opportunity opp : opps) {
            if(opp.StageName == 'Closed Won') {
                closedWonAmount += opp.Amount;
            } else if(opp.IsClosed == false) {
                pipelineAmount += opp.Amount;
            }
        }
    }

    public void finish(Database.BatchableContext bc) {
        // Prepare the current month in MON-YYYY format. Ex: JAN-2026
        String currentMonth = DateTime.now().format('MMM-yyyy').toUpperCase(); // APR-2026
        Forecast__c forecast = new Forecast__c(
            Name = currentMonth,
            Closed_Won__c = closedWonAmount,
            Pipeline__c = pipelineAmount);

        // Check if there is an existing forecast record for this month
        // If a record already exists for this month, go for update. Otherwise, insert.
        List<Forecast__c> existingForecasts = [SELECT Id FROM Forecast__c WHERE Name = :currentMonth LIMIT 1];
        if(!existingForecasts.isEmpty()) {
            forecast.Id = existingForecasts[0].Id;
        }
        upsert forecast;
    }
}