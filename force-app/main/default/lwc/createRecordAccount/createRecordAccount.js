import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordAccount extends LightningElement {

    typeOptions = [];
    industryOptions = [];
    accountRtId;
    formdata = {};

    changeHandler(event){
        const apiName = event.target.name;
        const value = event.target.value;
        this.formdata[apiName] = value;
        console.log(JSON.stringify(this.formdata));
    }

    cancelHandler(){
        this.template.querySelector("form.accform").reset();
        this.template.querySelectorAll('lightning-combobox').forEach(item => {
            item.value = undefined;
        })
        
    }
    saveHandler(){
        //Prepare recordInput
        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields: this.formdata
        };

        createRecord(recordInput)
            .then(result => {
                //show success message
                this.showToast('Success', 'Account record has been created successfully', 'success');
            })
            .catch(error => {
                //show error message
                this.showToast('Errorr', 'Error occurred while creating account', 'error');
                console.error(error);
            })
    }

    showToast(title, message, variant){
        const toast = new ShowToastEvent({ title, message, variant});
        this.dispatchEvent(toast);

    }

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    objectHandler({data, error}){
        if(data){
            this.accountRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName: ACCOUNT_OBJECT, recordTypeId: '$accountRtId' }) picklistHandler({data, error}){
        if(data){
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.industryOptions = data.picklistFieldValues.Industry.values;
        }
        if(error){
            console.error(error);
        }
    }

}