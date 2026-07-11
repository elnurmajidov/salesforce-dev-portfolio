trigger EmployeeTrigger on Employee__c (before insert, before update, after insert, after update) {
    // Before Triggers
    if(Trigger.isBefore) {
        if(Trigger.isInsert) {
            EmployeeTriggerHandler.beforeInsert(Trigger.new);
        }
        if(Trigger.isUpdate){
            EmployeeTriggerHandler.beforeUpdate(Trigger.newMap, Trigger.oldMap);
        }
    }

    //After Triggers
    if(Trigger.isAfter){
        if(Trigger.isInsert){
            EmployeeTriggerHandler.afterInsert(Trigger.new);
        }
    }
}