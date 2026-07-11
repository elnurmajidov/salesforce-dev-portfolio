trigger OpportunityTrigger1 on Opportunity (before insert) {
    if(Trigger.isBefore){
        if(Trigger.isInsert){
            // OpportunityTriggerHandler.beforeInsert(Trigger.new);
        }
    }
}