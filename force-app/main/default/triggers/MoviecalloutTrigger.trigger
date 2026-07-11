trigger MoviecalloutTrigger on Movie__c (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        MovieHandler.movieHelp(Trigger.new);
    }
}