import { LightningElement } from 'lwc';

import OPPORTUNITY_OBJECT from '@salesforce/schema/Opportunity';
import ACCOUNT_FIELD from '@salesforce/schema/Opportunity.AccountId';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSE_DATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';

import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class HomeworkOpportunityRecordForm extends LightningElement {
    objectName = OPPORTUNITY_OBJECT;
    recordId = '006fj00000742qdAAA';

    fields = [
        ACCOUNT_FIELD,
        NAME_FIELD,
        TYPE_FIELD,
        STAGE_FIELD,
        AMOUNT_FIELD,
        CLOSE_DATE_FIELD
    ];

    successHandler() {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Opportunity record has been saved successfully!',
                variant: 'success'
            })
        );
    }

    errorHandler() {
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error',
                message: 'Opportunity record could not be saved!',
                variant: 'error'
            })
        );
    }
}