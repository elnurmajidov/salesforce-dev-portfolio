// Create a class soqlParentChildRelationship.
// Create a method childToParent and Write an SOQL query for contact Object querying Account object fields in the same query referring ID and Name and pass them to a list<Contact> lstContact records.
// Run the above the over the for loop and display the account id and account name.
// Create a method parentToChild and Write an SOQL query for Object querying contact object fields in the same query referring ID and Name and pass them to a list<Account> lstAccount records.
// Run the above the over the for loop and display the Contact id and Contact name.


// Open the org and create 14 contacts and 4 account records by the following below instructions –
// 3 contacts by this name – Apple (Account Name)
// 4 contacts by this name - Meta  (Account Name)
// 2 contacts by this name - Tesla  (Account Name)
// 5 contacts by this name – Microsoft  (Account Name)

// Now create a query and show the total contacts of each company

public class soqlParentChildRelationship {
    public static void childToParent(){
        List<Contact> lstContact = [SELECT Id, Name, Account.Id, Account.Name FROM Contact];
        for(Contact con : lstContact){
            System.debug('Account Id = ' + con.Account.Id + 'Account Name = ' + con.Account.Name);
        }
    }

// Create a method parentToChild and Write an SOQL query for Account Object querying contact object fields in the same query referring ID and Name and pass them to a list<Account> lstAccount records.
// Run the above the over the for loop and display the Contact id and Contact name.

    public static void parentToChild(){
        List<Account> lstAccount = [SELECT Id, Name, (SELECT Id, Name FROM Contacts) FROM Account];
        for(Account acc : lstAccount){
            for(Contact con : acc.Contacts){
                System.debug('====Contac Id===' + con.Id + '====Contact Name==== ' + con.Name);
            }
            
        }
    }
}