public with sharing class GstHandler {
    public static void gstInfo(list<Gst_Number__c> triggerNew){
        for(Gst_Number__c gs  :  triggerNew){
            RestCallouts.getGstInfo(gs.id);
        }
    }
}