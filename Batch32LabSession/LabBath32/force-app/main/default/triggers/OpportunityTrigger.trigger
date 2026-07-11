trigger OpportunityTrigger on Opportunity (after insert, after update, after delete, after undelete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            OpportunityTriggerHandler.insertOpportunity(Trigger.new);
            
        }
        if (Trigger.isUpdate) {
            OpportunityTriggerHandler.updateAcct(Trigger.new, Trigger.oldMap);
        }
        if (Trigger.isDelete) {
            OpportunityTriggerHandler.deleteOpp(Trigger.old);
        }
        if (Trigger.isUndelete) {
            OpportunityTriggerHandler.insertOpportunity(Trigger.new);
        } 
        
    }

}