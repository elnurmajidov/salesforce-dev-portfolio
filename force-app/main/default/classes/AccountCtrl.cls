public with sharing class AccountCtrl {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Id, Name, Type, Industry, AnnualRevenue
            FROM Account
            WHERE AnnualRevenue != null
            ORDER BY AnnualRevenue DESC
        ];
    }
}