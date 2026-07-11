public with sharing class DML_Assign1 {
    public static void insertRecords(){
        List <Account> accList = new List<Account>();
        for (integer i = 1;  i <= 20; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i + ' Created ';
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            insert accList;
        }
    }
    public static void updateRecords(){
        List<Account> accUpdateList = [select Id, Name from account order by CreatedDate desc limit 20];
        for (Account acc : accUpdateList) {
            acc.Name = acc.Name + 'Updated';
        }
        if (!accUpdateList.isEmpty()) {
            update accUpdateList;
        }
    }
}