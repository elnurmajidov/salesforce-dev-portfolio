import ACCOUNT_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_FIELD from '@salesforce/schema/Case.ContactId';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import STATUS_FIELD from '@salesforce/schema/Case.Status';
import { LightningElement } from 'lwc';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import CASE from '@salesforce/schema/Case';
import {ShowToastEvent} from "lightning/platformShowToastEvent";

export default class RecordEditFormCase extends LightningElement {
     objectApiName = CASE;
        recordId = '500fj00000mA4u4AAC';

    fields={
        accountName:ACCOUNT_FIELD,
        contactName:CONTACT_FIELD,
        priority:PRIORITY_FIELD,
        subject:SUBJECT_FIELD,
        status:STATUS_FIELD,
        description:DESCRIPTION_FIELD,
        origin:ORIGIN_FIELD
    
    }
    successHandler(){
        const event = new ShowToastEvent({
      title: "Success",
      message:
        "Record saved successfully, Good Job.",
        variant:'success'
    });
    this.dispatchEvent(event);

    }
}