import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import LEADSOURCE_FIELD from '@salesforce/schema/Contact.LeadSource';
import TITLE_FIELD from '@salesforce/schema/Contact.Title';
import { api, LightningElement } from 'lwc';


export default class RecordViewFormContact extends LightningElement {
    @api objectApiName;
    @api recordId;

    fields = {
        firstName:FIRSTNAME_FIELD,
        lastName:LASTNAME_FIELD,
        leadSource:LEADSOURCE_FIELD,
        title:TITLE_FIELD
    }
}