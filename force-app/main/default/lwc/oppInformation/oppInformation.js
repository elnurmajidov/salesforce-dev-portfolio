import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJ from '@salesforce/schema/Opportunity';


export default class OppInformation extends LightningElement {
    oppName = '';
    selectedStage = '';
    selectedType = '';

    typeOptions = [];
    stageOptions = [];

    @wire(getObjectInfo, {objectApiName: OPP_OBJ})
    opportunityObjectInfo;

    @wire(getPicklistValuesByRecordType, {
        objectApiName: OPP_OBJ, 
        recordTypeId: "$opportunityObjectInfo.data.defaultRecordTypeId"})
        wiredpicklistvalues({ data, error}){

            if(data){
                this.typeOptions = data.picklistFieldValues.Type.values;
                this.stageOptions = data.picklistFieldValues.StageName.values;

                console.log(data);
            }else if (error) {
                console.error('picklistError:', error);
            }
        }
        handleChange(event){
            const fieldName = event.target.label;
            if(fieldName === 'Opportunity Name'){
                this.oppName = event.target.value
            }else if (fieldName === 'Type'){
                this.selectedType = event.target.value
            }else {
                this.selectedStage = event.target.value
            }
        }
    } 
