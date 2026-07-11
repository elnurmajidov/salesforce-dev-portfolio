trigger AccountTrigger on Account (after insert, after update, before delete) {
    
    if(Trigger.isAfter && Trigger.isUpdate){
        VipServiceHandler.checkRulesAndProcess(trigger.new,trigger.oldMap);
    }


// Bir account create edildiğinde ona bağlı contact create eden kodu yazalım.
// (Accountun Id si olusmalı o nedenle after ınsert)

    if(Trigger.isAfter && Trigger.isInsert){
        // AccountTriggerHandler.createRelatedContact(Trigger.new);
        AccountTriggerHandler.createFutureRelatedContact(Trigger.newMap.keySet());
    }



    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.createOpportunity(Trigger.new);
    }

    if(Trigger.isAfter && Trigger.isUpdate){
        AccountTriggerHandler.updateRelatedTasks(trigger.newMap);
        // AccountTriggerHandler.updateRelatedOpportunities(trigger.new, trigger.oldMap,trigger.newMap);
        AccountTriggerHandler.updateRelatedOpportunities2( trigger.oldMap,trigger.newMap);
    }

    if(Trigger.isBefore && Trigger.isDelete){
        // Sadece Id leri parametre olarak göndermek yeterli
        AccountTriggerHandler.reparentDeletedTask(trigger.oldMap.keySet());
    }
}