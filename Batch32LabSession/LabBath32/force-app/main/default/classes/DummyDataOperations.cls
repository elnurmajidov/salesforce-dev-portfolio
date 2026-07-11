// Create a class named DummyDataOperations and write methods for each of the following requirements:

// 1. Write a logic to create and return n number of opportunities for a particular account.
// AccountId and n will be passed as parameters.
// Populate opportunity fields as follows:
// ● Name as parent account’s name.
// ● Close Date as 6 months from today.
// ● Stage as Prospecting.
// ● Amount as parent account’s Annual Revenue divided by n.
// ○ Prevent dividing by zero and print a suitable system.debug message.

public class DummyDataOperations {
    public static List<Opportunity> nNumberofOpportunities(Id accountId, Integer n){
        Account acc = [SELECT Id, Name, AnnualRevenue 
                       FROM Account
                       WHERE Id = :accountId
                       LIMIT 1];

        List<Opportunity> oppList = new List<Opportunity>();
        if (n != null && n > 0){
            for(integer i = 0; i<n; i++){
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name;
                opp.AccountId = acc.Id;
                opp.CloseDate = Date.today().addMonths(6);
                opp.StageName = 'Prospecting';  
                opp.Amount = acc.AnnualRevenue / n;

                oppList.add(opp);
            }
            insert oppList;
            
        }
        else {
            System.debug(' n parameter cannot be zero ');
        }
        return oppList;
    }

// 2. Delete all the Closed Lost opportunities with Amount less than 20000.

    public static void deleteLostOpportunities(){
        List<Opportunity> oppDelete = [SELECT Id
                                       FROM Opportunity
                                       WHERE stageName = 'Closed Lost'
                                       AND Amount < 20000];
        delete oppDelete;
    }

// 3. Take two parameters: industry and email. For all accounts in that industry, find all child contacts with null Email fields and change their email fields as the given value. At the end of the operation, print a system.debug message showing how many emails were changed.  Example: “Total number of emails changed: 11”.

    public static void updateContactEmail (string industry, string email){
        //list<Account> accList = [SELECT Id, Name, (SELECT Id, Email FROM Contacts WHERE Email = null) FROM Account WHERE Industry =: Industry];
                                
        List<Contact> conList = [SELECT Id, Name
                                 FROM Contact
                                 WHERE Email = null
                                 AND Account.industry =: industry];
        for(contact con:conList){
            con.email = email;

        }
        update conList;
        System.debug('Total number of emails changed :' + conList.size());
    }
}