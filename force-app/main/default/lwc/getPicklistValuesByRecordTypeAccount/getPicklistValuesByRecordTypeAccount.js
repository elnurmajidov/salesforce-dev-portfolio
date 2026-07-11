import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account'

export default class GetPicklistValuesByRecordTypeAccount extends LightningElement {
    accountRtId; //default account record type id
    typeOptions = []; //type picklist values
    industryOptions = []; //industry picklist values
    selectedType; //selected type value
    selectedIndustry; //selected industry value

    changeHandler(event){
        if(event.target.label === "Type"){
            this.selectedType = event.detail.value;
        } else {
            this.selectedIndustry = event.detail.value;
        }
    }

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountHandler({data, error}){
        if(data){
            this.accountRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValuesByRecordType, {objectApiName: ACCOUNT_OBJECT, recordTypeId: '$accountRtId'})
    picklistHandler({data, error}){
        if(data){
            console.log(data);
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.industryOptions = data.picklistFieldValues.Industry.values;
        }
        if(error){
            console.error(error);
        }
    }
}
