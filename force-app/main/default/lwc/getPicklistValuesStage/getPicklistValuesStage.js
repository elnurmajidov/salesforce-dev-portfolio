import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import STAGE_FILED from '@salesforce/schema/Opportunity.StageName';
import OPP_OBJECT from '@salesforce/schema/Opportunity';

export default class GetPicklistValuesStage extends LightningElement {

    oppRtId;
    stageOptions = [];
    selectedStage;

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppHandler({data, error}){
        if(data){
            this.oppRtId = data.defaultRecordTypeId;
        }
        if(error){
            console.error(error);
        }
    }

    @wire(getPicklistValues, {fieldApiName: STAGE_FILED, recordTypeId: '$oppRtId'})
    picklistHandler({data, error}){
        if(data){
            this.stageOptions = data.values;
        }
        if(error){
            console.error(error);
        }
    }

    changeHandler(event){
        this.selectedStage = event.detail.value;
    }
}
