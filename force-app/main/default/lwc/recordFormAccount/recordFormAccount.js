import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class RecordFormAccount extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    recordId = "001fj00000Wns6XAAR";
    fields = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, RATING_FIELD, PHONE_FIELD, REVENUE_FIELD];

    successHandler(){
        const toast = new ShowToastEvent({
            title: "Success",
            message: "Account record has been saved successfully!",
        });
        this.dispatchEvent(toast);
    }

}