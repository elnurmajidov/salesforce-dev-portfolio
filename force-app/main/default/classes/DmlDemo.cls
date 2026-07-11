public with sharing class DmlDemo {
    public static void dmlDemoInsert_stndObj1(){
        //1.Create new instance
        account acc = new account();
        //2. Set field values
        acc.Name = 'Softinnovas';
        //Final
        insert acc; //this will create a new record.
    }
    public static void dmlDemoInsert_stndObj(){
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn dml';
        sp.Description__c = 'Learn dml Batch32';
        sp.Status__c = 'New';

        insert sp;
    }

    public static void dmlUpdateDemo_stndObj1(){
        Account acc = new account();
        acc.Name = 'Salesfroce';
        System.debug('Before inserting ac ' + acc);
        insert acc;
        System.debug('Record is inserted now ac: ' + acc);

        //we now have ID in accounts instance 'acc'
        //we need ID if we want to update a record
        acc.Name = 'Salesforce Inc.';
        //Update
        update acc;
    }
    public static void dmlUpdateDemo_stndObj2(){
         account acc = [SELECT Id, Name FROM Account WHERE Name LIKE 'Softinnovas%' LIMIT 1];
         //now set new field value
         acc.Name = 'Softinnovas Inc.';
         acc.Phone = '99999999999';
         update acc;
         System.debug('acc ' + acc);
     }
     public static void dmlInsertDemo_stndObj2(){
        account acc = [SELECT Id, Name FROM Account WHERE Name LIKE 'Softinnovas%' LIMIT 1];
        //create contact instance
        contact c = new contact();
        c.LastName = 'Biden';
        //setting relationship
        c.AccountId = acc.Id;
        
        insert c;     
    }
}