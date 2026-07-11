public  class SoqlExamples {
// StageName i Closed Won olan oppleri getiren method yazalım.
    public static void getOpportunities(){
        List<Opportunity> opportunities = [SELECT Id,Name,CloseDate,Amount FROM Opportunity WHERE StageName = 'Closed Won'];
        System.debug(opportunities);
    }

    // Amountu en büyük ve stageName i Closed Won olan opp i return eden methodu yazalım

    public static Opportunity getHighestOpportunity(){
        Opportunity opp = [SELECT Id,Name,Amount FROM Opportunity WHERE Amount != null AND StageName = 'Closed Won' ORDER BY Amount DESC LIMIT 1];
        return opp;
    }

    // Son 90 gün içinde kapanacak olan (CloseDate) opp recordlarını bulalım ve return edelim
    public static List<Opportunity> getOpportunitiesByCloseDate(){
        List<Opportunity> opportunities = [SELECT Id,Name,CloseDate,Amount 
                                            FROM Opportunity 
                                            WHERE CloseDate = LAST_N_DAYS:90
                                            ORDER BY CloseDate];
        return opportunities;
    }

    // son create edilen Account recordunu return eden methodu yazın

    public static Account getLastCreatedAccount(){
        Account acc = [SELECT Id,Name,AnnualRevenue FROM Account WHERE AnnualRevenue != null ORDER BY CreatedDate DESC LIMIT 1];
        String accName = acc.Name;
        Decimal accAR = acc.AnnualRevenue;
        System.debug('Account Name => ' + accName + ', AnnualRevenue ==> ' + accAR);
        return acc;
    }

    // StageName i parametredeki değere göre filtreleyen ve bir accounta bağlı olan opportuniyleri return eden methodu yazalım

    public static List<Opportunity> getOpportunitiesByStageName(String param){
        List<Opportunity> opportunities = [SELECT Id,Name FROM Opportunity WHERE  AccountId != null AND Name LIKE : '%' + param + '%'];
        return opportunities;
    }

    // En az 1 tane Case recordu olan Contactları getiren method yazalım
    public static List<Contact> getContactsRelatedCase(){
        // parentın Id si childın relationshipship fieldının valuesuna eşittir.
        List<Contact> contacts = [SELECT Id,FirstName,LastName,Phone FROM Contact WHERE Id IN (SELECT ContactId FROM Case WHERE ContactId != null)];
        return contacts;
    }



}