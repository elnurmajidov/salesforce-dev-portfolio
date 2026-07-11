trigger CaseTrigger on Case (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    // System.debug('We are in the triggers');

    // if(Trigger.isAfter){
    //     System.debug('We are in the after triggers');
    //     if(Trigger.isInsert){
    //         System.debug('We are in the after insert triggers');
    //     } else if(Trigger.isUpdate){
    //         System.debug('We are in the after update triggers');
    //     }

    // } else if(Trigger.isBefore){
    //     System.debug('We are in the before triggers');
    //     if(Trigger.isInsert){
    //         System.debug('We are in the before insert triggers');
    //     } else if(Trigger.isUpdate){
    //         System.debug('We are in the before update triggers');
    //     }
    // }

    // if(Trigger.isBefore){
    //     if(Trigger.isInsert){
    //         CaseTriggerHandler.caseCreated(Trigger.new);

    //     }
    // }
    // if(Trigger.isBefore){
    //     if(Trigger.isInsert){
    //         CaseTriggerHandler.caseCreated(Trigger.new);
    
    // }
    if(trigger.isAfter && trigger.isInsert){
        CaseTaskHandler.task(trigger.new);
    }
}