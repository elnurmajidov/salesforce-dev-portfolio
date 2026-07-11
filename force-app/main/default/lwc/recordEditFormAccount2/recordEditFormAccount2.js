import { api, LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class RecordEditFormAccount2 extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    @api recordId = '001fj00000Wns6XAAR';
    fields = {
        name: NAME_FIELD,
        industry: INDUSTRY_FIELD,
        phone: PHONE_FIELD,
        type: TYPE_FIELD,
        rating: RATING_FIELD,
        revenue: REVENUE_FIELD
    };

    successHandler(){
        const toast = new ShowToastEvent({
            title: "Success",
            message: "Record has been saved successfully",
            variant: "success"
        });
        this.dispatchEvent(toast);
    }
}
