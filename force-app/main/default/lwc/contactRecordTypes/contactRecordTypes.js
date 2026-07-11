import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import LEVEL_FIELD from '@salesforce/schema/Contact.Level__c';
import LEAD_SOURCE_FIELD from '@salesforce/schema/Contact.LeadSource';

export default class ContactRecordTypes extends LightningElement {
    europeRecordTypeId;
    levelOptions = [];
    leadSourceOptions = [];
    selectedLevel;
    selectedLeadSource;
    error;
    
    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    objectInfoHandler({data, error}){
        if(data){
            const recordTypes = Object.values(data.recordTypeInfos);
            const europeRecordType = recordTypes.find(recordType => recordType.name === 'Europe');

            this.europeRecordTypeId = europeRecordType?.recordTypeId;
            this.error = undefined;
        }
        if(error){
            this.error = error.body?.message || 'Could not load Contact record types';
            console.error(error);
        }
    }

    @wire(getPicklistValues, {recordTypeId: '$europeRecordTypeId', fieldApiName: LEVEL_FIELD})
    levelPicklistHandler({data, error}){
        if(data){
            this.levelOptions = data.values;
        }
        if(error){
            this.error = error.body?.message || 'Could not load Level picklist values';
            console.error(error);
        }
    }

    @wire(getPicklistValues, {recordTypeId: '$europeRecordTypeId', fieldApiName: LEAD_SOURCE_FIELD})
    leadSourcePicklistHandler({data, error}){
        if(data){
            this.leadSourceOptions = data.values;
        }
        if(error){
            this.error = error.body?.message || 'Could not load Lead Source picklist values';
            console.error(error);
        }
    }

    changeHandler(event){
        if(event.target.name === 'level'){
            this.selectedLevel = event.detail.value;
        }
        if(event.target.name === 'leadSource'){
            this.selectedLeadSource = event.detail.value;
        }
    }

    get hasPicklistValues(){
        return this.europeRecordTypeId && this.levelOptions.length && this.leadSourceOptions.length;
    }

    get isLoading(){
        return !this.hasPicklistValues && !this.error;
    }
}
