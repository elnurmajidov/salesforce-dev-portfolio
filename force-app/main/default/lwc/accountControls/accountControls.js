import { LightningElement } from 'lwc';
import getAccounts from '@salesforce/apex/AccountCtrl.getAccounts';

export default class AccountControls extends LightningElement {
    accounts = [];
    totalRevenue = 0;
    highestRevenue = 0;
    activeView = 'accounts';
    errorMessage = '';
    isLoading = false;
    hideCheckboxColumn = false;

    columns = [
        { label: 'Account Name', fieldName: 'Name', sortable: true },
        { label: 'Account Type', fieldName: 'Type', sortable: true },
        { label: 'Industry', fieldName: 'Industry', sortable: true },
        {
            label: 'Annual Revenue',
            fieldName: 'AnnualRevenue',
            type: 'currency',
            sortable: true,
            typeAttributes: {
                currencyCode: 'USD',
                maximumFractionDigits: 2
            },
            cellAttributes: { alignment: 'right' }
        }
    ];

    connectedCallback() {
        this.handleShowAccounts();
    }

    get showAccounts() {
        return this.activeView === 'accounts' && !this.isLoading && !this.errorMessage;
    }

    get showTotal() {
        return this.activeView === 'total' && !this.isLoading && !this.errorMessage;
    }

    get showHighest() {
        return this.activeView === 'highest' && !this.isLoading && !this.errorMessage;
    }

    get showAllButtonClass() {
        return this.getButtonClass('outline', this.activeView === 'accounts');
    }

    get totalButtonClass() {
        return this.getButtonClass('brand', this.activeView === 'total');
    }

    get highestButtonClass() {
        return this.getButtonClass('success', this.activeView === 'highest');
    }

    get formattedTotalRevenue() {
        return this.formatCurrency(this.totalRevenue);
    }

    get formattedHighestRevenue() {
        return this.formatCurrency(this.highestRevenue);
    }

    loadAccounts() {
        this.isLoading = true;
        this.errorMessage = '';

        return getAccounts()
            .then(result => {
                this.accounts = result || [];
                this.calculateRevenueValues();
            })
            .catch(error => {
                this.accounts = [];
                this.totalRevenue = 0;
                this.highestRevenue = 0;
                this.errorMessage = this.getErrorMessage(error);
                // eslint-disable-next-line no-console
                console.error('Error loading accounts:', error);
            })
            .finally(() => {
                this.isLoading = false;
            });
    }

    handleShowAccounts() {
        this.loadAccounts().then(() => {
            this.activeView = 'accounts';
        });
    }

    handleTotalRevenue() {
        this.loadAccounts().then(() => {
            this.activeView = 'total';
        });
    }

    handleHighestRevenue() {
        this.loadAccounts().then(() => {
            this.activeView = 'highest';
        });
    }

    calculateRevenueValues() {
        const revenues = this.accounts
            .map(account => Number(account.AnnualRevenue) || 0)
            .filter(revenue => revenue > 0);

        this.totalRevenue = revenues.reduce((sum, revenue) => sum + revenue, 0);
        this.highestRevenue = revenues.length ? Math.max(...revenues) : 0;
    }

    formatCurrency(value) {
        return new Intl.NumberFormat('en-US', {
            style: 'currency',
            currency: 'USD',
            maximumFractionDigits: 2
        }).format(value || 0);
    }

    getButtonClass(theme, isActive) {
        return `control-button ${theme} ${isActive ? 'active' : ''}`;
    }

    getErrorMessage(error) {
        return error?.body?.message || error?.message || 'Accounts could not be loaded.';
    }
}
