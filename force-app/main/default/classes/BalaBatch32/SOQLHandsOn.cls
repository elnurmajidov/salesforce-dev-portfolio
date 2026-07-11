public with sharing class SOQLHandsOn {

    /**
     * Write a method that gives all the accounts based on the given industry.
     * Input: Industry
     * Output: List<Account> whose Industry = Given Industry
     */
    public List<Account> getAccountsByIndustry(String industry){
        List<Account> accounts = [
            SELECT Id, NAme, Type, AnnualRevenue, Rating
            FROM Account
            WHERE Industry = :industry
        ];
        return accounts;
    }
    /**
     * Get all the opportunities available under the given set of account ids
     * Input: Set<Id> accountsIds
     * Output: List<Opportunity>
     */
    public List<Opportunity> getOppsByAccounts(Set<Id> accountIds){
        List<Opportunity> opps = [
            SELECT ID, Name, Amount, StageName, CloseDate
            FROM Opportunity
            WHERE AccountId IN :accountIds
        ];
        return opps;
    }
    /**
     * Get all the caontacts with valid email adress. Also bring down each contact's account name & rating
     * Input: NA
     * Output: List<Contact>
     */
    public List<Contact> getContactsWithValidEmail(){
        List<Contact> contacts = [
            SELECT ID, FirstName, LastName, Email, Title, Account.Name, Account.Rating
            FROM Contact
            WHERE Email != NULL
        ];
        return contacts;
    }
}