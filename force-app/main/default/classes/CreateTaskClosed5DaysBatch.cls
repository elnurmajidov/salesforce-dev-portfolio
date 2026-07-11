public class CreateTaskClosed5DaysBatch implements Database.Batchable<sObject>,Schedulable {

      public void execute(SchedulableContext SC) {
       CreateTaskClosed5DaysBatch cas = new CreateTaskClosed5DaysBatch();
Database.executeBatch(cas);

      
    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        if(!Test.isRunningTest()){
            return Database.getQueryLocator([SELECT Id, Status, OwnerId, LastModifiedDate FROM Case WHERE Status !='Closed' AND LastModifiedDate <LAST_N_DAYS:5]);
        }else{
            return Database.getQueryLocator([SELECT Id, Status, OwnerId, LastModifiedDate FROM Case WHERE Status !='Closed' ]);
        }
    }

    public void execute(Database.BatchableContext BC, List<Case> scope) {
        List<Task> taskToInsert = new List<Task>();

        for (Case css  : scope) {
            task t = new task();
            t.subject = 'Critical action needed ';
            t.ActivityDate = date.today().addDays(2);
            t.Description = 'Complete Fast';
            t.WhatId = css.id;
            t.OwnerId = css.OwnerId;
            t.Status = 'In Progress';

        taskToInsert.add(t);
        }
        if (!taskToInsert.isEmpty()) {
            insert taskToInsert;
            
        }
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Task Created');
    }

}