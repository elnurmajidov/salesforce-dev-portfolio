import { deleteRecord } from 'lightning/uiRecordApi';
import { api, LightningElement } from 'lwc';
import { NavigationMixin } from "lightning/navigation";

export default class DeleteRecordAccount extends NavigationMixin(LightningElement)  {
    @api recordId;
    handleClick(){
        deleteRecord(this.recordId)
        .then(result => {
             this[NavigationMixin.Navigate]({
                type: "standard__objectPage",
                attributes: {
                objectApiName: "Account",
                actionName: "home",
      },
    });
        })
        .catch(error => console.log(error)
        )
    }
}