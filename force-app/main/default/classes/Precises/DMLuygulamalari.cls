public class DMLuygulamalari {
    public static void createContact(){
        Contact besira = new Contact();
        besira.Salutation = 'Ms.';
        besira.LastName = 'Imamaliyeva ';
        
        insert besira;
    }

    public static void createUpdateContact(){
        contact c = new Contact();
        c.LastName = 'Kara';
        insert c;
        System.debug(c);

        c.FirstName = 'Cem';
        update c;
    }

    public static void updateContactOne (){
        contact besira = [select id, LastName, FirstName from contact where LastName = 'Imamaliyeva' limit 1];
        besira.FirstName = 'Ilham';
        besira.Phone = '+156989876857';
        besira.Email = 'ilhamaliyev99@gmail.ru';
        
        update besira;

    }
   //====================//====================//====================//

    public static id createAccount(){
        
        account acc = new account();
        acc.Name = 'Test account dml new 34';
        insert acc;
        return acc.id;
   }

    public static void createContact1(){

        id accId = createAccount();
        contact con = new contact();
        con.LastName = 'Contact Dml';
        con.AccountId = accId;
        insert con;

   }
    public static void updateOneContact(){
        // account acc = [select id, name from account where name = 'Test account dml new 34' limit 1];
        account acc = [select id, name from account order by CreatedDate desc limit 1];
        contact con = [select id, lastName from contact where AccountId = null limit 1];
        System.debug('contact =>' + con);
        con.AccountId = acc.id;
        update con;
   }
}