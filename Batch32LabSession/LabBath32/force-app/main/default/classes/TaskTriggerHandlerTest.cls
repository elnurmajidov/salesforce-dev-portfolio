@isTest
public with sharing class TaskTriggerHandlerTest {
    @isTest
    public static void positiveDeletetaskTest() {
              
        task t = new task();
        t.Subject='Example 1';
        t.Priority='High';
        t.Status='Completed';
        insert t;

        test.starttest();
        boolean errorFlag =false;
        try {
            delete t;
            
        } catch (Exception e) {
            errorFlag=true;        
            
        }        
        test.stoptest();
        Assert.isfalse(errorFlag,'errorflag should be false');    

    }
    @istest
    public static void negativeDeletetaskTest(){
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User' limit 1];
    
    User u = new User(Alias = 'st', Email='standarduser@testorg.com',
    EmailEncodingKey='UTF-8', LastName='ABC', LanguageLocaleKey='en_US',
    LocaleSidKey='en_US', ProfileId = p.Id  ,
    TimeZoneSidKey='America/Los_Angeles', Username='example@user.com',
    CommunityNickname = 'Test');    
    insert u;

    boolean errorFlag=false;
    string errormessage ;
  
    test.startTest();

    system.Runas(u){
          task t = new task();
        t.Subject='Example 1';
        t.Priority='High';
        t.Status='Completed';
        insert t;
        
        try {
            delete t;
        } catch (Exception e) {
            errorFlag=true;
            errormessage=e.getMessage();
                    
        }

    }
    test.stoptest();
    Assert.isTrue(errorFlag, 'errorflag should be true');
    assert.isTrue(errormessage.contains('only System administrator can delete'));


    }

}