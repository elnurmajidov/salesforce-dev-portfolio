public class DMLuygulamalari2 {
    public static void createMultipleAccountsAndContacts(){
        // 5 account create etme
        List <account> accList = new List <account>();
        for (Integer i = 1; i <= 5; i++) {
            account acc = new Account();
            acc.name = 'Account Demo' + i;
            accList.add(acc);
        }
        if (!accList.isEmpty()) {
            insert accList;
        }

        List<Contact> conList = new List<Contact>();
        for (account ac : accList) {
            for (integer i = 1; i <= 5; i++) {
                contact cn = new Contact();
                cn.LastName = 'Contact Demo LN' + i;
                cn.AccountId = ac.id;
                conList.add(cn);
            }
            
        }
        if (!conList.isEmpty()) {
            insert conList;
        }
    }
}