import FAX_FIELD from '@salesforce/schema/Account.Fax';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import OWNERSHIP_FIELD from '@salesforce/schema/Account.Ownership';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import { api, LightningElement } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class RecordEditFormAccount extends LightningElement {
    isIndustry = false;
    isOwnership = false;
    isFax = false;

    @api objectApiName;
    @api recordId;
    fields ={
        name:NAME_FIELD,
        rating:RATING_FIELD,
        industry:INDUSTRY_FIELD,
        ownership:OWNERSHIP_FIELD,
        fax:FAX_FIELD
    }
    changeHandler(event){
        if(event.target.value == 'Hot'){
            this.isIndustry = true;
            this.isOwnership = false ;
            this.isFax = false;
        }else if(event.target.value == 'Cold'){
            this.isOwnership = true;
            this.isIndustry = false;
            this.isFax = false;
        }else if(event.target.value == 'Warm'){
            this.isFax = true;
            this.isIndustry = false;
            this.isOwnership = false ;
        }else if(event.target.value == ''){
            this.isIndustry = false;
            this.isOwnership = false ;
            this.isFax = false;
        }
    }
    successHandler(){
         const evt = new ShowToastEvent({
            title: "Account Status",
            message:"İşleminiz başarılı oldu.",
            variant:"Success"
        
    });
    this.dispatchEvent(evt);
    }
}