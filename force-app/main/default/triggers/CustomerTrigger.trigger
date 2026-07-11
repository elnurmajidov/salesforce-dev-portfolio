/* A. Whenever a new Customer is created, create following default Payment records
  • Amount = $0.1, Mode = Online
  • Amount = $1, Mode = Crypto
  */

trigger CustomerTrigger on Customer__c (after insert, before delete) {

    if (Trigger.isAfter && Trigger.isInsert){
        CustomerTriggerHandler.whenCustomercrt(Trigger.new);
    }

    if(Trigger.isBefore && Trigger.isDelete){
        CustomerTriggerHandler.activeCustomerDelete(Trigger.Old);
    }
}