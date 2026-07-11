// İstenen şey	SOQL’de karşılığı
// Alan seçmek	SELECT
// Obje	FROM
// Boş alan	= NULL
// Sıralama	ORDER BY
// A → Z	ASC
// Z → A	DESC

// •	SELECT → “Hangi bilgileri istiyorum?”        
// •	FROM → “Hangi objeden?”
// •	WHERE → “Filtre var mı?”
// •	ORDER BY → “Nasıl sıralayayım?”

//==============================================//==============================================//==============================================//

//Answer 1   Select Id, CaseNumber, ContactId, subject, status, priority, OwnerId from case

//Answer 2 : Select Id, AccountId, FirstName, name, LastName,Email from Contact 

//Answer 3 :Select Id, Name from Account where Phone = null order by name asc

//Answer 4 Select Id, FirstName, LastName,  AccountId     from Contact Where AccountId != null

//==============================================//==============================================//==============================================//

// Question 1: SOQL – Medium
// Write the SOQL query for the following requirements:
// 1. Fetch all the opportunities which have stage as Closed Won and Amount more than or equal to 35000.
// 2. Fetch all the contacts and their related Account Name, order them by the contact’s last name in descending order.
// 3. Fetch all the Accounts along with their related Opportunities with StageName other than Closed Lost.
// 4. Find the Top 10 opportunities based on Amount value.
// 5. Find lower 20 opportunities based on Amount value which are not set to Closed Won and not to Closed Lost stage.

// question 1.1
// SELECT Id, Name, stageName, Amount
// FROM Opportunity 
// WHERE StageName = 'closed won' and amount >= 35000


// 1.2
// SELECT Id, FirstName, LastName, Account.Name
// FROM Contact
// ORDER BY lastName desc

// 1.3
// SELECT Id, Name, (select Id, stageName from opportunities where stageName != 'Closed lost')

// FROM Account

// 1.4
// SELECT Id, Name, Amount
// FROM Opportunity
// Order by Amount DESC limit 10

// 1.5
// SELECT Id, Name, Amount, StageName
// FROM Opportunity
// WHERE StageName NOT IN ('Closed won', 'Closed lost')

//==============================================//==============================================//==============================================//
// Question 2: SOQL In Apex
// Create a class named as AccConAndOppOperations and Write methods for each of the following
// requirements:
// 1. Write the logic to fetch and return all the accounts. Include account name, annual revenue, type,
// and source of account.
// 2. Find all the opportunities which have Lead Source as 'Web' and Stage as 'Closed Lost'. Make it
// dynamic so that it works for other stages and Lead sources as well.
// 3. Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and print the
// Opportunity Name and Amount for the related 'Closed Won' opportunities. Each opportunity
// record should be printed in a different line.

 public class AccConAndOppOperations {

    //1.Write the logic to fetch and return all the accounts. Include account name, annual revenue, type,
    //and source of account.

    public static List <account> allAccounts() {

        List<account> listAcc1= [select id,name,annualRevenue,type,AccountSource from Account ];

        System.debug('list account is'+listAcc1);
        return listAcc1;
    }

    //2.Find all the opportunities which have Lead Source as 'Web' and Stage as 'Closed Lost'. Make it
    //dynamic so that it works for other stages and Lead sources

    public static List<Opportunity> listOpportunities(){

        List<Opportunity> listOPP=[select id,name,LeadSource,StageName from Opportunity
        Where LeadSource='Web'and StageName ='Closed Lost'];

        System.debug('list of opportunities'+listOPP);
        return listOPP;
    }

    //3.Print the Annual revenue and name of all the accounts of type 'Customer - Direct' and print the
    //Opportunity Name and Amount for the related 'Closed Won' opportunities. Each opportunity
    //record should be printed in a different line

    public static list<account> listAccAnnRev(){

        list<account> listAccRev=[ select id,name,AnnualRevenue, Type, (select name,amount, StageName from Opportunities where StageName='Closed Won') from Account 
        where Type='Customer - Direct'];
        System.debug('list of Account Rev'+listAccRev);
        return listAccRev;
    }

//3.1 Prepare a method that returns the sum of all the closed won opportunities Amount present in
    //the org
    
    public static AggregateResult listOppSum(){

        AggregateResult resultSum=[Select SUM(amount)
        from Opportunity
        where stageName='Closed won' 
        ];

        System.debug('list of opportunities'+resultSum);
        return resultSum;

}
    //3.2 Prepare a method that will return all the Accounts for which at least a closed Won Opportunity is
    //present. Make it dynamic if we want to bring account for other opportunity stageNames

    public static List<Account> listAccStage(string stgName){
       List<Account> listAccStage=[Select id,name from Account

        where Id IN (select Accountid from Opportunity where stageName =: stgName )
         ];
         System.debug('our stage name is'+stgName);
        System.debug('list of accounts'+listAccStage);
        return listAccStage;
  
        }

    //3.3 Prepare a method that will return all the Accounts for which at least one contact is present

    public static list<account> getListOfCont(){
        List<account> listOfCont =[Select id,name from Account where Id IN (select Accountid from Contact where AccountId != null)
        ];
        System.debug('list of contacts'+listOfCont);
        return listOfCont;

    }
}

//==============================================//==============================================//==============================================//

// Question 4 – Find the Errors
// Highlight and discuss if there are any problems or malpractices used in the below code snippets.
// (Assume the accountList variable has account records in it.)
//1. 
//     list<contact> recordList= new list<Contact>();
//         recordList=[select Id, name from contact];
//         System.debug(recordList);

//  2. list<contact> c= [select id, from contact ];
//     System.debug(c);

//     contact c1=[select id, name from Contact limit 1];
//     System.debug(c1);