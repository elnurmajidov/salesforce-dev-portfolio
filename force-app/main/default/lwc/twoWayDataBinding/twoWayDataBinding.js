import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullname = "Micheal Jown";
    title = "Salesforce Developper";

    changeHandler(event){
        this.target = event.target.value;
    }
}