// Question 1: DML and SOQL
// Write methods in the DummyDataCreation for each of the following requirements:
// 1. Write a method which should return the account record after creating it. Take Name, Annual
// Revenue, Type as input parameters and populate the values in the account record. If Name is not
// provided, then do not create the account and show a message like Account without name
// cannot be created.
// 2. Update the description field of top 10(amount wise) opportunities as "This is one of the top 10
// opportunities. Please work on this properly “.
// 3. Delete all the opportunities with amount less than 20000 and status as closed lost(optional).
// 4. Find out all the Account which have no contacts attached to them. Add a contact for each one of
// them and update the last Name of contact with the Name field of account. (optional)
// 5. Write a logic to create N number of Accounts, and return all the accounts created.
// Populate - Account Name, Rating, Phone, Shipping Address, and Billing Address.
// Example - parameter -> 5. Method returns 5 newly created accounts.
// a. Call this method from anonymous apex file
// 6. Write a logic to create N number of Contacts for each account (pass List of account in
// parameter), and return all Contacts created.
// Populate - contact first name, last name, accountid, phone, mailing address, other address.
// Example - parameters - (3, listAcc). Method creates 3 contacts for each account passed in list.
// a. Call this method from anonymous file, pass the list of account returned from (1.a)
// 7. (optional) Write a logic to create CASE for each contact (pass list of contact in parameter)
// populate fields - contact, account, subject, stage, case origin.
// Example - parameter - (listcontact). Method created case for each contact, and return all the
// cases.
// a. Call this method from anonymous file, pass the list of contacts returned from (6.a)

public class DummyDataCreation {
    public static account createAcc(string name, decimal annualRevenue, string typeValue){
        if(string.isBlank(name)){
            System.debug('Account without name cannot be created');
            return null;
        }
        account acc = new account();
        acc.Name = Name;
        acc.annualRevenue = annualRevenue;
        acc.Type = typeValue;
        insert acc;
        return acc;

    }

// 2. Update the description field of top 10(amount wise) opportunities as "This is one of the top 10 opportunities. Please work on this properly “.

    public static void update10Opportunities(){
        list<opportunity> oppList =[SELECT Id, description
                                     FROM Opportunity
                                     ORDER BY Amount DESC 
                                     LIMIT 10];
        for(Opportunity opp : oppList){
            opp.Description = 'This is one of the top 10 opportunities. Please work on this properly ';

        }

        update oppList;
        
    }

// 3. Delete all the opportunities with amount less than 20000 and status as closed lost(optional).
    public static void deleteAmountOpportunities(){
        list<opportunity> oppDelete =[SELECT Id
                                      FROM Opportunity
                                      WHERE Amount < 20000
                                      AND stageName = 'Closed Lost' ];

        delete oppDelete;
    }

// 4. Find out all the Account which have no contacts attached to them. Add a contact for each one of them and update the last Name of contact with the Name field of account. (optional)

    public static void addContactToAccountsWithNoContacts(){
        list<Account> accList = [SELECT Id, Name
                                 FROM Account
                                 WHERE Id
                                 NOT IN (SELECT AccountId FROM Contact)];

        list<contact> contactToInsert = new list<contact>();

        for(Account acc : accList){
            contact c = new contact();
            c.AccountId = acc.Id;
            c.LastName = acc.Name;
            contactToInsert.add(c);
        }
        insert contactToInsert;
    }

// 5. Write a logic to create N number of Accounts, and return all the accounts created.
// Populate - Account Name, Rating, Phone, Shipping Address, and Billing Address.
// Example - parameter -> 5. Method returns 5 newly created accounts. a. Call this method from anonymous apex file

    public static list<account> createAccounts(integer howMany){
        list<Account> accList = new list<account>();

        for(integer i = 1; i <= howMany; i++){
            account a = new Account();
            a.Name = 'Test Acc' + i;
            a.Rating = 'Hot';
            a.Phone = '978785878787';
            //a.ShippingAddress = 'ShippingAddress ';
            a.BillingCity = 'Istanbul';
            a.ShippingCity = 'Trabzon';
            
            accList.add(a);

        }
        insert accList;
        
        return accList;
    }

// 6. Write a logic to create N number of Contacts for each account (pass List of account in parameter), and return all Contacts created.
// Populate - contact first name, last name, accountid, phone, mailing address, other address.
// Example - parameters - (3, listAcc). Method creates 3 contacts for each account passed in list.
// a. Call this method from anonymous file, pass the list of account returned from(1a)

    public static list<contact> createContactsForAccounts(integer n, list<account> accList){
        list<contact> conList = new List<contact>();
        for(Account acc : accList){ 
            for(integer i=1; i <= n; i++){
                Contact con = new Contact();
                con.FirstName = 'First' + i;
                con.LastName = 'Statham';
                con.AccountId = acc.Id;
                con.Phone = '9868678868';
                //con.mailingAddress = 'Brooklyn';
                con.mailingStreet = '4232 Bedford Ave';

                conList.add(con);
            }
        }

        insert conList;
        return conList;
    }
}