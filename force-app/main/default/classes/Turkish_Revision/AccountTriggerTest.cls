@isTest
private class AccountTriggerTest{
    @isTest
    static void triggerTest(){
        Account acc = new Account(Name = 'Test Acc', Rating = 'Hot');
        insert acc;

        Account generalAccount = new Account(Name = 'GENERAL ACCOUNT', Rating = 'Hot');
        insert generalAccount;

        acc.Name = 'Updated Acc';
        update acc;

        delete acc;
    }
}