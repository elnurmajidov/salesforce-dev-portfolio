public class SoqlPractice4 {
// Child -> Parent : Return Contact List
    public static List <Contact> childToParent(String accName){
        List<Contact> listOfContact = [SELECT Id, Name, accountId, account.Name
                                       FROM Contact
                                       WHERE Account.Name = :accName];
        return listOfContact;
    }

// Parent -> Child 

    public static void parentToChild (String accName){
        List<account> listOfAccount = [SELECT Name, (SELECT CaseNumber, Origin, Priority, Subject FROM Cases)
                                       FROM Account
                                       WHERE Name =: accName];
        for(account eachAcc : listOfAccount){
            System.debug('-------ACCOUNT------');
            System.debug('Account Name: ' + eachAcc.name);
            for(case eachCase : eachAcc.cases){
                System.debug('-----CASE------');
                System.debug('Case Number: ' + eachCase.CaseNumber + 'n Case Origin: ' + eachCase.Origin + 'n Priority: ' + eachCase.Priority + 'n Subject: ' + eachCase.Subject);
            }
            System.debug('<-------CASE DATA SUMMARY------>');
            System.debug('Total Case Number: ' + eachAcc.cases.size());
        }
    }
}