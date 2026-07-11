import MailingCity from '@salesforce/schema/Contact.MailingCity';
import MailingCountry from '@salesforce/schema/Contact.MailingCountry';
import MailingPostalCode from '@salesforce/schema/Contact.MailingPostalCode';
import MailingState from '@salesforce/schema/Contact.MailingState';
import MailingStreet from '@salesforce/schema/Contact.MailingStreet';
import { getRecord } from 'lightning/uiRecordApi';
import { api, LightningElement, wire } from 'lwc';

const FIELDS = [MailingCity,MailingCountry,MailingPostalCode,MailingState,MailingStreet];


export default class GetRecordContactAddress extends LightningElement {

    @api recordId;
    @wire(getRecord,{recordId : '$recordId', fields: FIELDS})
    contactAddress;
    get street(){
        return this.contactAddress.data.fields.MailingStreet.value;
    }
    get city(){
        return this.contactAddress.data.fields.MailingCity.value;
    }
    get country(){
        return this.contactAddress.data.fields.MailingCountry.value;
    }
    get state(){
        return this.contactAddress.data.fields.MailingState.value;
    }
    get postalCode(){
        return this.contactAddress.data.fields.MailingPostalCode.value;
    }
}