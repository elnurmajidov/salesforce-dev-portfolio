public class CustomerTriggerHandler {
    public static void whenCustomerCrt(List<customer__c> cosTriggerNew) {
        List <Payment__c> newPay = new List<Payment__c>();
        for(Customer__c eachCus : cosTriggerNew){
            Payment__c pay1 = new payment__c();
            pay1.Amount__c = 0.1;
            pay1.Mode__c = ' Online ';
            pay1.customer__c = eachCus.Id;
            Payment__c pay2 = new payment__c();
            pay2.Amount__c = 1;
            pay2.Mode__c = ' Crypto ';
            pay2.Customer__c = eachCus.Id;
            newPay.add(pay1);
            newPay.add(pay2);
        
        }
        if(!newPay.isEmpty()){
            insert newPay;
        }
    }
    public static void activeCustomerDelete (list<customer__c> cusTriggerOld){
        set<Id> activeCustomerIds = new set<Id>();
        for(customer__c eachCustomer : cusTriggerOld){
            if(eachCustomer.Active__c == TRUE){
                activeCustomerIds.add(eachCustomer.Id);
            }
        }
        if(activeCustomerIds.isEmpty()){
            List<Payment__c> finalpayments = [SELECT Id FROM payment__c WHERE Customer__c IN : activeCustomerIds];
            if(!finalPayments.isEmpty()){
                delete finalPayments;
            }
        }
    }
}