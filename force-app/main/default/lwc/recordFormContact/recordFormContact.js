import CONTACT_OBJ from '@salesforce/schema/Contact';
import FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import LASTNAME from '@salesforce/schema/Contact.LastName';
import LEADSOURCE from '@salesforce/schema/Contact.LeadSource';
import PHONE from '@salesforce/schema/Contact.Phone';
import TITLE from '@salesforce/schema/Contact.Title';
import { LightningElement } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";


export default class RecordFormContact extends LightningElement {
    recordId = '';
    objectApiName = CONTACT_OBJ;
    fields = [FIRSTNAME, LASTNAME, LEADSOURCE,PHONE,TITLE ]

    handleSuccess(){
        const event = new ShowToastEvent({
            title: "Contact Status",
            message:' İşlemminiz başarılı bir şekilde gerçekleştirildi.',
            variant:'success'
        
    });
    this.dispatchEvent(event);
    }

    handleError(){
        const event = new ShowToastEvent({
            title: "Contact Status",
            message:' Hata aldınız.',
            variant:'error'
        
    });
    this.dispatchEvent(event);
    }
}