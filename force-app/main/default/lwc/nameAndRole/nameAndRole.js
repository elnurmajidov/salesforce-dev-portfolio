import { LightningElement } from 'lwc';

export default class NameAndRole extends LightningElement {
    userName = '';
    role = '';

     get roleOptions() {
        return [
            { label: 'Salesforce Admin', value: 'Salesforce Admin' },
            { label: 'Salesforce Developer', value: 'Salesforce Developer' },
            { label: 'Salesforce Architect', value: 'Salesforce Architect' }
        ];
    }  
    changeHandler(event){
        this.userName=event.detail.value;
        //this.userName=event.target.value;
        

        console.log(event);
    }

    roleHandler(event){
        this.role=event.detail.value;
        //this.role=event.target.value;
    }
    
}

