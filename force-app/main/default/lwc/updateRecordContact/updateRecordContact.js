import FIRSTNAME from '@salesforce/schema/Contact.FirstName';
import LASTNAME from '@salesforce/schema/Contact.LastName';
import PHONE from '@salesforce/schema/Contact.Phone';
import { getRecord, updateRecord } from 'lightning/uiRecordApi';
import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

const FIELDS=[FIRSTNAME,LASTNAME,PHONE]

export default class UpdaterEcordContact extends LightningElement {
conId="003fj00000wAhYXAA0"
contactInfo;
formData={}

    @wire(getRecord,{recordId:'$conId',fields:FIELDS})
    contactHandler({data,error}){
        if(data){
            console.log("contactınfo",data);
            this.contactInfo=data;
        }
    }
    changeHandler(event){
        const name = event.target.name;
        const value = event.target.value;
        //const{name,value} = event.target
        this.formData[name]= value;
    }
    handleUpdate(){
        const name ="Id"
        const value =this.conId;
        this.formData[name]= value;
        const recordInput ={
            fields:this.formData
        }
        updateRecord(recordInput)
         .then(res => {
                        const evt = new ShowToastEvent({
                                    title: "Contact Status",
                                    message:"İşleminiz başarılı oldu.",
                                    variant:"Success"
                                
                            });
                            this.dispatchEvent(evt);
                            
                            
        
                    })
                .catch(error => console.log('hata oluştu')
                )
    }
}