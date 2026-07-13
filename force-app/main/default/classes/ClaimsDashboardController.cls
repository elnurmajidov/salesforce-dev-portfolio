/**
 * @description       Read-only Apex controller for the policyClaimsDashboard LWC.
 *                    Aggregates claim statistics for a single Policy_Master__c record
 *                    so the record page can show a claims summary at a glance.
 * @author            Elnur Majidov
 * @group             Insurance Policy & Claims Management
 */
public with sharing class ClaimsDashboardController {

    /**
     * @description Builds an aggregated claims summary for one policy.
     *              Uses exactly three SOQL queries regardless of claim volume
     *              (policy lookup, GROUP BY aggregate, recent claims) — no queries in loops.
     * @param policyId Id of the Policy_Master__c record the component is placed on
     * @return ClaimsSummary wrapper consumed by the LWC via @wire
     */
    @AuraEnabled(cacheable=true)
    public static ClaimsSummary getClaimsSummary(Id policyId) {
        if (policyId == null) {
            throw new AuraHandledException('A policy Id is required to load the claims summary.');
        }

        // WITH USER_MODE enforces object/field level security of the running user
        Policy_Master__c policy = [
            SELECT Coverage_Limit__c, Total_Claims__c, Total_Claims_Amount__c
            FROM Policy_Master__c
            WHERE Id = :policyId
            WITH USER_MODE
            LIMIT 1
        ];

        ClaimsSummary summary = new ClaimsSummary();
        summary.coverageLimit    = policy.Coverage_Limit__c;
        summary.totalClaims      = policy.Total_Claims__c == null ? 0 : Integer.valueOf(policy.Total_Claims__c);
        summary.totalClaimAmount = policy.Total_Claims_Amount__c == null ? 0 : policy.Total_Claims_Amount__c;
        summary.statusBreakdown  = buildStatusBreakdown(policyId);
        summary.approvedAmount   = sumApprovedAmount(summary.statusBreakdown);
        summary.remainingCoverage = calculateRemainingCoverage(summary.coverageLimit, summary.approvedAmount);
        summary.recentClaims     = [
            SELECT Name, Status__c, Claim_Amount__c, Claim_Date__c
            FROM Insurance_Claim__c
            WHERE Policy__c = :policyId
            WITH USER_MODE
            ORDER BY Claim_Date__c DESC, Name DESC
            LIMIT 10
        ];
        return summary;
    }

    /**
     * @description Groups the policy's claims by status in a single aggregate query.
     */
    private static List<StatusBreakdown> buildStatusBreakdown(Id policyId) {
        List<StatusBreakdown> breakdown = new List<StatusBreakdown>();
        for (AggregateResult result : [
            SELECT Status__c status, COUNT(Id) claimCount, SUM(Claim_Amount__c) totalAmount
            FROM Insurance_Claim__c
            WHERE Policy__c = :policyId
            WITH USER_MODE
            GROUP BY Status__c
        ]) {
            StatusBreakdown row = new StatusBreakdown();
            row.status      = (String) result.get('status');
            row.claimCount  = (Integer) result.get('claimCount');
            row.totalAmount = (Decimal) result.get('totalAmount');
            breakdown.add(row);
        }
        return breakdown;
    }

    /**
     * @description Only Approved and Paid claims count against the coverage limit;
     *              New/Under Review claims are not yet a liability and Rejected never will be.
     */
    private static Decimal sumApprovedAmount(List<StatusBreakdown> breakdown) {
        Decimal approved = 0;
        for (StatusBreakdown row : breakdown) {
            if (row.status == 'Approved' || row.status == 'Paid') {
                approved += row.totalAmount == null ? 0 : row.totalAmount;
            }
        }
        return approved;
    }

    /**
     * @description Remaining coverage never goes below zero for display purposes.
     */
    private static Decimal calculateRemainingCoverage(Decimal coverageLimit, Decimal approvedAmount) {
        if (coverageLimit == null) {
            return 0;
        }
        Decimal remaining = coverageLimit - approvedAmount;
        return remaining < 0 ? 0 : remaining;
    }

    /** @description Wire-friendly wrapper returned to the LWC. */
    public class ClaimsSummary {
        @AuraEnabled public Integer totalClaims { get; set; }
        @AuraEnabled public Decimal totalClaimAmount { get; set; }
        @AuraEnabled public Decimal approvedAmount { get; set; }
        @AuraEnabled public Decimal coverageLimit { get; set; }
        @AuraEnabled public Decimal remainingCoverage { get; set; }
        @AuraEnabled public List<StatusBreakdown> statusBreakdown { get; set; }
        @AuraEnabled public List<Insurance_Claim__c> recentClaims { get; set; }
    }

    /** @description One row per claim status with count and summed amount. */
    public class StatusBreakdown {
        @AuraEnabled public String status { get; set; }
        @AuraEnabled public Integer claimCount { get; set; }
        @AuraEnabled public Decimal totalAmount { get; set; }
    }
}
