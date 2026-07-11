trigger AccountTrigger on Account (before insert,before update, after update, after insert) {

//     When the Annual revenue value of an Account is reduced from the previous value then Throw
// error with the following message:
// a. 'Annual Revenue for an account cannot be reduced'.
// And do not allow the user to save the record
    if(Trigger.isBefore){
        if(Trigger.isUpdate){
            AccountTriggerHandler.AccountRevenueValue(Trigger.new,Trigger.oldMap);

        }
    }
    // if(Trigger.isAfter) {
    //     if(Trigger.isInsert) {
    //         AccountTriggerHandler.createNewContact(trigger.new);
    //         AccountTriggerHandler.createNewContact(trigger.new);
    //     }
    //     if(Trigger.isUpdate) {
    //          AccountTriggerHandler.updateOppWhenAccountChanged(trigger.new);
    //         AccountTriggerHandler.AccountRelatedContact(Trigger.new, Trigger.oldMap, Trigger.NewMap);
    //     }
    // }
}
