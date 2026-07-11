trigger TaskTrigger on Task (before delete) {
    if (Trigger.isBefore && Trigger.isDelete) {
        TaskTriggerHandler.deleteTaskError(Trigger.old);
        
    }
}