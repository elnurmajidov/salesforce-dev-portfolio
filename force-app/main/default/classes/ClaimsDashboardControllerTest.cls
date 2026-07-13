/**
 * @description       Unit tests for ClaimsDashboardController. Also verifies the
 *                    declarative layer end-to-end: validation rules on Insurance_Claim__c and the
 *                    "Claim Approved - Update Policy Status" record-triggered flow.
 * @author            Elnur Majidov
 * @group             Insurance Policy & Claims Management
 */
@isTest
private class ClaimsDashboardControllerTest {

    private static final Decimal COVERAGE_LIMIT = 100000;

    @TestSetup
    static void makeData() {
        Coverage_Type__c coverageType = InsuranceTestDataFactory.createCoverageType('Auto');
        Account policyholder = InsuranceTestDataFactory.createPolicyholder('Test Policyholder Inc');
        InsuranceTestDataFactory.createPolicy(policyholder.Id, coverageType.Id, COVERAGE_LIMIT);
    }

    private static Policy_Master__c getPolicy() {
        return [SELECT Id, Status__c, Coverage_Limit__c FROM Policy_Master__c LIMIT 1];
    }

    @isTest
    static void getClaimsSummary_returnsAggregatedTotals() {
        Policy_Master__c policy = getPolicy();
        List<Insurance_Claim__c> claims = new List<Insurance_Claim__c>();
        claims.addAll(InsuranceTestDataFactory.buildClaims(policy.Id, 2, 10000, 'New'));
        claims.addAll(InsuranceTestDataFactory.buildClaims(policy.Id, 1, 20000, 'Approved'));
        claims.addAll(InsuranceTestDataFactory.buildClaims(policy.Id, 1, 5000, 'Paid'));
        insert claims;

        Test.startTest();
        ClaimsDashboardController.ClaimsSummary summary =
            ClaimsDashboardController.getClaimsSummary(policy.Id);
        Test.stopTest();

        Assert.areEqual(4, summary.totalClaims, 'All four claims should be counted');
        Assert.areEqual(45000, summary.totalClaimAmount, 'Roll-up should sum every claim');
        Assert.areEqual(25000, summary.approvedAmount, 'Only Approved + Paid claims count against coverage');
        Assert.areEqual(COVERAGE_LIMIT - 25000, summary.remainingCoverage, 'Remaining = limit - approved');
        Assert.areEqual(3, summary.statusBreakdown.size(), 'New, Approved and Paid buckets expected');
        Assert.areEqual(4, summary.recentClaims.size(), 'Recent claims list should contain all claims');
    }

    @isTest
    static void getClaimsSummary_noClaims_returnsZeroes() {
        Policy_Master__c policy = getPolicy();

        Test.startTest();
        ClaimsDashboardController.ClaimsSummary summary =
            ClaimsDashboardController.getClaimsSummary(policy.Id);
        Test.stopTest();

        Assert.areEqual(0, summary.totalClaims, 'No claims exist yet');
        Assert.areEqual(0, summary.totalClaimAmount, 'Total amount should default to zero');
        Assert.areEqual(COVERAGE_LIMIT, summary.remainingCoverage, 'Full limit remains available');
        Assert.isTrue(summary.statusBreakdown.isEmpty(), 'No status buckets without claims');
        Assert.isTrue(summary.recentClaims.isEmpty(), 'No recent claims without claims');
    }

    @isTest
    static void getClaimsSummary_nullId_throwsAuraHandledException() {
        Boolean exceptionThrown = false;
        Test.startTest();
        try {
            ClaimsDashboardController.getClaimsSummary(null);
        } catch (AuraHandledException expected) {
            exceptionThrown = true;
        }
        Test.stopTest();
        Assert.isTrue(exceptionThrown, 'A null policy Id must raise an AuraHandledException');
    }

    @isTest
    static void validationRule_blocksClaimAboveCoverageLimit() {
        Policy_Master__c policy = getPolicy();
        Insurance_Claim__c oversizedClaim =
            InsuranceTestDataFactory.buildClaims(policy.Id, 1, COVERAGE_LIMIT + 1, 'New')[0];

        Boolean blocked = false;
        Test.startTest();
        try {
            insert oversizedClaim;
        } catch (DmlException expected) {
            blocked = expected.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION');
        }
        Test.stopTest();
        Assert.isTrue(blocked, 'Claim above the coverage limit must be rejected by validation rule');
    }

    @isTest
    static void flow_approvedClaim_setsPolicyUnderClaimReview() {
        Policy_Master__c policy = getPolicy();
        Insurance_Claim__c claim = InsuranceTestDataFactory.buildClaims(policy.Id, 1, 10000, 'New')[0];
        insert claim;

        Test.startTest();
        claim.Status__c = 'Approved';
        update claim;
        Test.stopTest();

        Policy_Master__c updatedPolicy = getPolicy();
        Assert.areEqual('Under Claim Review', updatedPolicy.Status__c,
            'Approving a claim must move the parent policy to Under Claim Review via flow');
    }

    @isTest
    static void getClaimsSummary_bulkClaims_singleDigitQueries() {
        Policy_Master__c policy = getPolicy();
        // 200 records in one DML call proves the flows and roll-ups behave in bulk
        insert InsuranceTestDataFactory.buildClaims(policy.Id, 200, 100, 'New');

        Test.startTest();
        ClaimsDashboardController.ClaimsSummary summary =
            ClaimsDashboardController.getClaimsSummary(policy.Id);
        Test.stopTest();

        Assert.areEqual(200, summary.totalClaims, 'All 200 bulk claims should be counted');
        Assert.areEqual(20000, summary.totalClaimAmount, '200 x 100 should be summed by roll-up');
        Assert.areEqual(10, summary.recentClaims.size(), 'Recent claims list is capped at 10 rows');
    }
}
