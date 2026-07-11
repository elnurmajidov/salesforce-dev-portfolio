public class SoqlDemo {
    public static void accounSOQL_1(){
        list<account> listAcc = [Select Id, name, phone From Account Order By createddate desc];
        System.debug('List of accounts ' + listAcc);
    }
    public static void accounSOQL_11(){
        account acc = [Select Id, name, phone From Account Order By createddate desc limit 1];
        System.debug(' accounts acc ' + acc);
    }

    public static void accounSOQL_2(){
        account acc = [Select Id, name, phone, AccountNumber From Account Order By createddate desc limit 1];
        System.debug('accounts acc ' + acc);
        string aName = acc.name;
        string aPhone = acc.Phone;
        System.debug('account name is ' + aName + ', phone is ' + aPhone + ',account number is ' + acc.AccountNumber);
    }
    

    public static void accountSOQL_3(){
        list<account> listAccount = [SELECT Id, Name, Phone, accountNumber
                                     FROM account
                                     ORDER BY createddate
                                     DESC 
                                     LIMIT 1];

        for(account eachAccount : listAccount){
            System.debug('-----eachaccount loop start-----');
            System.debug('each account record : ' + eachAccount);
            string accName = eachAccount.Name;
            string accPhone = eachAccount.Phone;
            System.debug('account name is ' + accName + ', account phone is ' + accPhone + ', acc number is ' + eachAccount.accountnumber);
            System.debug('-----eachaccount loop END----');
        }
    }
    public static void accountFilter_SOQL(){
        string accountNameFilter = 'sForce';
        list<account> listAcc = [SELECT Id, Name
                                 FROM account
                                 WHERE name = :accountNameFilter];
        System.debug('list acc ' + listAcc);
    }
    //Method 2
    public static void accountFilter_SOQL(string accountNameFilter){
        list<account> listAcc = [SELECT Id, Name
                                 FROM account
                                 WHERE name = :accountNameFilter];
        System.debug('list acc ' + listAcc);
    }
}