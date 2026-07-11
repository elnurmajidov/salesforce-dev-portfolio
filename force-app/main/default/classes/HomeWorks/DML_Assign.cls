public  class DML_Assign {
    public static void dml_insert(){

        //Account acc = new Account();
        //acc.name = 'Elnur Assignment 1';
        //insert acc;

        //Account acc1 = new Account();
        //acc1.name = 'Elnur Assignment2';
        //insert acc1;

        List<account> accList = new List<account>();
        accList.add(new Account(name = 'Elnur Assignment 1'));
        accList.add(new Account(name = 'Elnur Assignment 2'));

        insert accList;
        System.debug('Account inserted!!');
    }

    public static void updating_dml(){
        Account acc = new Account();
        acc.Name = 'Account Created';
        insert acc;

        acc.Name = 'Account Updated';
        update acc;
        System.debug('Account Updated!');
    }
}