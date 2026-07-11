/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an org are executed whenever Apex code is deployed
 * to a production org to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production org. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the org size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class AccountTriggerHandlerTest {

    @TestSetup
    static void makeData(){
        // Account generalAccount = new Account(Name='GENERAL ACCOUNT');
        // insert generalAccount;

        insert new Account(Name='GENERAL ACCOUNT');

        List<Account> accounts = new List<account>();

        for(Integer i= 1;i<=200;i++){
            Account acc = new Account(Name='Test Acc '+ i, Industry='Education',AnnualRevenue=10000);
            accounts.add(acc);
        }

        insert accounts;


       List<Task> tasks = new List<Task>();
       List<Opportunity> opportunities = new List<Opportunity>();

       for(Account acc: accounts){
            tasks.add(new Task(Subject='Test Task',Status='Open',Priority='High',WhatId=acc.Id));
            opportunities.add(new Opportunity(Name='Test Opp',StageName='Prospecting',CloseDate=Date.today(), AccountId =acc.Id));
       }

       insert tasks;
       insert opportunities;

    }

    @isTest
    static void updateRelatedTasksTest(){
        // Accountlar guncellenmeli(otomatik olarak method calısacak)
        // Taskte update gerceklestimi kontrol edilmeli
        Test.startTest();
        List<Account> accounts = [SELECT Id,Name FROM Account WHERE Name LIKE 'Test Acc%'];
        for(Account acc: accounts){
            acc.Name +=  'Updated';
        }

        update accounts;

        Test.stopTest();

        list<Task> tasks = [SELECT Id,Description FROM Task WHERE WhatId IN:accounts];
        for(Task ts: tasks){
            Assert.areEqual('Accountunuz update oldu , gerekli kontrolleri sağlayın', ts.Description);
        }
    }

    @isTest
    static void reparentDeletedTaskTest(){
        // Accountlar silinmeli
        // silinen acc lara ait taskler GENERAL Accounta bağlandımı test edilmeli
        Test.startTest();

        Account generalAccount = [SELECT Id FROM Account WHERE Name ='GENERAL ACCOUNT' LIMIT 1];

        List<Account> accounts = [SELECT Id,Name FROM Account WHERE Name LIKE 'Test Acc%' LIMIT 50];

        delete accounts;

        Test.stopTest();

        List<Task> tasks = [SELECT Id FROM Task WHERE WhatId =: generalAccount.Id ];
        Integer taskSize = [SELECT Count() FROM Task WHERE WhatId =: generalAccount.Id];

        Assert.areEqual(50, tasks.size());
        Assert.isTrue(50==taskSize);
    }


    @isTest
    static void createFutureRelatedContactTest(){
        Account acc = new Account(Name='Test Acc');
        Test.startTest();
        insert acc;
        Test.stopTest();

       Contact con = [SELECT Id FROM Contact WHERE AccountId = :acc.Id LIMIT 1];

       Assert.isNotNull(con, 'Accounta bağlı contact create edilmiş olmalı');

    }

    

}