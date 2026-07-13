import { LightningElement, api, wire } from 'lwc';
import getClaimsSummary from '@salesforce/apex/ClaimsDashboardController.getClaimsSummary';

// Datatable columns for the recent claims list
const COLUMNS = [
    { label: 'Claim #', fieldName: 'Name', type: 'text' },
    { label: 'Date', fieldName: 'Claim_Date__c', type: 'date-local' },
    { label: 'Status', fieldName: 'Status__c', type: 'text' },
    {
        label: 'Amount',
        fieldName: 'Claim_Amount__c',
        type: 'currency',
        cellAttributes: { alignment: 'right' }
    }
];

export default class PolicyClaimsDashboard extends LightningElement {
    @api recordId; // Policy_Master__c Id injected by the record page

    columns = COLUMNS;
    summary;
    error;

    @wire(getClaimsSummary, { policyId: '$recordId' })
    wiredSummary({ data, error }) {
        if (data) {
            this.summary = data;
            this.error = undefined;
        } else if (error) {
            this.error = this.reduceError(error);
            this.summary = undefined;
        }
    }

    get isLoading() {
        return !this.summary && !this.error;
    }

    get hasClaims() {
        return this.summary && this.summary.totalClaims > 0;
    }

    // Percentage of the coverage limit already consumed by approved/paid claims
    get coverageUsedPercent() {
        if (!this.summary || !this.summary.coverageLimit) {
            return 0;
        }
        const used = (this.summary.approvedAmount / this.summary.coverageLimit) * 100;
        return Math.min(Math.round(used), 100);
    }

    get coverageBarStyle() {
        return `width: ${this.coverageUsedPercent}%;`;
    }

    // Warn visually when more than 75% of the coverage is consumed
    get coverageBarClass() {
        const base = 'slds-progress-bar__value';
        return this.coverageUsedPercent > 75 ? `${base} coverage-bar-warning` : base;
    }

    reduceError(error) {
        if (error?.body?.message) {
            return error.body.message;
        }
        return 'An unexpected error occurred while loading the claims summary.';
    }
}
