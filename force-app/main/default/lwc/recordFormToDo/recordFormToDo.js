import { LightningElement } from 'lwc';
import TODO_OBJECT from '@salesforce/schema/ToDo__c';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class RecordFormToDo extends LightningElement {
    objectName = TODO_OBJECT;
    recordId = "a0Jfj000001zEyLEAU";

    successHandler(){
        const toast = new ShowToastEvent({
            titlle: "Success",
            message: "ToDo has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(toast);
    }
}