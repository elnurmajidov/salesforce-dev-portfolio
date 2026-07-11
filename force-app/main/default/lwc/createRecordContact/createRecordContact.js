import CON_OBJ from '@salesforce/schema/Contact';
import LEADSOURCE from '@salesforce/schema/Contact.LeadSource';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { createRecord } from 'lightning/uiRecordApi';
import { LightningElement ,wire} from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class CreateRecordContact extends LightningElement {
    leadSourceOptions=[];
    formData ={}


    @wire(getObjectInfo,{objectApiName:CON_OBJ})
    contact;
    @wire(getPicklistValues,{fieldApiName:LEADSOURCE,recordTypeId:'$contact.data.defaultRecordTypeId'})
    picklistHandler({data,error}){
        console.log("Lead source values",data);
        if(data){
            this.leadSourceOptions = data.values

        }
    }
        
    

    changeHandler(event){
        const {name,value} =event.target;
        this.formData[name] =value
        }
    handleCancel(){
        this.refs.contactForm.reset();
        this.refs.combobx.value= undefined;

    }
    handleSave(){
        let recordInput = { 
            apiName: CON_OBJ.objectApiName, 
            fields:this.formData}

        createRecord(recordInput)
            .then(res => {
                const evt = new ShowToastEvent({
                            title: "Contact Status",
                            message:"İşleminiz başarılı oldu.",
                            variant:"Success"
                        
                    });
                    this.dispatchEvent(evt);
                    //this.refs.contactForm.reset();
                    //this.refs.combobx.value= undefined;
                    this.handleCancel();

            })
        .catch(error => console.log('hata oluştu')
        )
        
    }
}