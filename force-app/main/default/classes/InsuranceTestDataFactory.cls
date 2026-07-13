/**
 * @description       Central test data factory for the Insurance Policy & Claims app.
 *                    Keeps test classes free of repeated record-building code and
 *                    guarantees records always satisfy the validation rules.
 * @author            Elnur Majidov
 * @group             Insurance Policy & Claims Management
 */
@isTest
public class InsuranceTestDataFactory {

    /** @description Creates and inserts an active coverage type for the given line of business. */
    public static Coverage_Type__c createCoverageType(String lineOfBusiness) {
        Coverage_Type__c coverageType = new Coverage_Type__c(
            Name = lineOfBusiness + ' Standard Coverage',
            Line_of_Business__c = lineOfBusiness,
            Active__c = true,
            Description__c = 'Standard ' + lineOfBusiness + ' coverage created for unit tests.'
        );
        insert coverageType;
        return coverageType;
    }

    /** @description Creates and inserts a policyholder Account. */
    public static Account createPolicyholder(String accountName) {
        Account policyholder = new Account(Name = accountName);
        insert policyholder;
        return policyholder;
    }

    /**
     * @description Creates and inserts an Active policy valid from one year ago to one year ahead,
     *              so claims dated TODAY always pass the Claim_Date_Within_Policy_Period rule.
     */
    public static Policy_Master__c createPolicy(Id policyholderId, Id coverageTypeId, Decimal coverageLimit) {
        Policy_Master__c policy = new Policy_Master__c(
            Policyholder__c = policyholderId,
            Coverage_Type__c = coverageTypeId,
            Status__c = 'Active',
            Start_Date__c = Date.today().addYears(-1),
            End_Date__c = Date.today().addYears(1),
            Premium_Amount__c = 1200,
            Coverage_Limit__c = coverageLimit
        );
        insert policy;
        return policy;
    }

    /**
     * @description Builds (without inserting) a list of claims so callers can insert
     *              in bulk and test bulkified behaviour with one DML statement.
     */
    public static List<Insurance_Claim__c> buildClaims(Id policyId, Integer howMany, Decimal amountEach, String status) {
        List<Insurance_Claim__c> claims = new List<Insurance_Claim__c>();
        for (Integer i = 0; i < howMany; i++) {
            claims.add(new Insurance_Claim__c(
                Policy__c = policyId,
                Status__c = status,
                Claim_Amount__c = amountEach,
                Claim_Date__c = Date.today(),
                Description__c = 'Test claim #' + i
            ));
        }
        return claims;
    }
}
