public class StudyHourExamples{
    public static Decimal calculateDiscount(Decimal price) {
        if (price < 0) {
            return 0; 
        }
        return price * 0.90; 
    }
    public Id createAccount(String accName, String industry) {
        if (String.isBlank(accName)) {
            return null;
        }
        
        Account newAcc = new Account(Name = accName, Industry = industry);
        insert newAcc; 
        return newAcc.Id;
    }
    
    public List<Account> getAccountsByName(String searchName) {
        return [SELECT Id, Name, Industry FROM Account WHERE Name = :searchName];
    }

    public void updateLeadStatus(Id leadId) {
        Lead myLead = [SELECT Id, Email, Status FROM Lead WHERE Id = :leadId LIMIT 1];

      
        if (myLead.Email != null) {
            myLead.Status = 'Working - Contacted';
        } else {
            myLead.Status = 'Open - Not Contacted';
        }

       
        update myLead;
    }

}