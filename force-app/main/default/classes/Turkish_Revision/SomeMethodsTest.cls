@isTest
public class SomeMethodsTest {
    @isTest
    private static void sayHelloTest(){
        SomeMethods sm = new SomeMethods();
        sm.sayHello();
    }

    @isTest
    private static void sayHello2Test(){
        SomeMethods sm = new SomeMethods();
        sm.sayHello2('John');
    }

    @isTest
    static void greetingTest(){
        
        SomeMethods sm = new SomeMethods();
        time tm = Time.newInstance(8, 30, 0, 0);
        String result1 = sm.greeting(tm);
        Assert.areEqual('Good Morning', result1);

        String result2 = sm.greeting(Time.newInstance(18, 45, 00, 0));
        Assert.areEqual('Good day', result2);

        String result3 = sm.greeting(Time.newInstance(22, 45, 00, 0));
        Assert.areEqual('Good evening', result3);
    }


    @isTest
    static void forLoopExampleTest(){
        SomeMethods sm = new SomeMethods();

        Integer result1 = sm.forLoopExample(5);
        Assert.areEqual(15, result1);

        Integer result2 = sm.forLoopExample(10);
        Assert.areEqual(55, result2,'Beklenen değer 55 olmalı');
    }
    
    @isTest
    static void getAvaregeTest(){
       SomeMethods sm = new SomeMethods();

       Decimal result1 = sm.getAvarege(5, 9, 7);
       Assert.areEqual(7, result1);
    }

    @isTest
    static void insertAccountTest(){

        
        SomeMethods.insertAccount('Arçelik');
        
        Test.startTest();
        List<Account> accounts = [ SELECT Id,Name FROM Account WHERE Name = 'Arçelik'];
        // Account acc = [SELECT Id,Name FROM Account WHERE Name = 'Arçelik' LIMIT 1];
        Assert.areEqual(1, accounts.size());
        Assert.isFalse(accounts.isEmpty());
        Assert.isTrue(!accounts.isEmpty());

        for(Account acc:accounts){
            Assert.areEqual('Arçelik', acc.Name);
        }
        Test.stopTest();
    }

    @isTest
    public static void getAccount2Test(){

        Test.startTest();

        Account acc = new Account();
        acc.Name = 'Test Acc';
        insert acc;

        Account acc2 = new Account();
        acc2.Name = 'Test Acc2';
        insert acc2;

        List<Opportunity> lstOpp = new List<Opportunity>();
        for(integer i = 0 ; i<5 ; i++){
            Opportunity opp = new Opportunity();
            opp.Name = 'Test Opp ' + i;
            opp.StageName = 'Prospecting';
            opp.CloseDate = Date.today();
            if(i<3){
                opp.AccountId = acc.Id;
            }else{
                opp.AccountId =  acc2.Id;
            }
            lstOpp.add(opp);
        }

        insert lstOpp;

        Test.stopTest();

        Integer result = SomeMethods.getAccount2();
        Assert.areEqual(2, result);

    }

}