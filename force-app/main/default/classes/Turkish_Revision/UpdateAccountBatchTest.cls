@isTest
public class UpdateAccountBatchTest {
    @TestSetup
    static void makeData(){
        List<Account> accounts = new List<Account>();
        for(Integer i = 0; i < 300 ; i++){
            if(i<100){
                accounts.add(new Account(
                    Name= 'Test Acc ' + i,
                    Industry = 'Technology',
                    Type = 'Customer - Direct'
                ));
            }else{
                accounts.add(new Account(
                    Name= 'Test Acc ' + i,
                    Industry = 'Education',
                    Type = 'Customer - Direct'
                ));
            }
        }
        insert accounts;
    }

    @isTest
    static void batchExecuteTest(){
        Test.startTest();
        Database.executeBatch(new UpdateAccountBatch());
        Test.stopTest();

        Integer technologyRecSize = [SELECT Count() FROM Account WHERE Industry='Technology' AND type = 'Customer'];
        Assert.areEqual(100, technologyRecSize, '100 tane kayıt gelmeli');

        List<Account> accounts = [SELECT Id,Type FROM Account WHERE Industry='Technology'];
        for (Account acc : accounts) {
            Assert.areEqual('Customer', acc.Type);
        }

        List<Account> accounts2 = [SELECT Id,Type,Industry FROM Account];
        for (Account acc : accounts2) {
            if(acc.Industry == 'Technology'){
                Assert.areEqual('Customer', acc.Type);
            }else{
                Assert.areNotEqual('Customer', acc.Type);
            }
        }
    }
}