trigger GstInfoTrigger on Gst_Number__c (after insert) {
    if(trigger.isAfter && trigger.isInsert){
        GstHandler.gstInfo(trigger.new);
    }
}