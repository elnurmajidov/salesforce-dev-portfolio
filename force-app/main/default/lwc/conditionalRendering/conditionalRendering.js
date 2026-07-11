import { LightningElement } from 'lwc';

export default class ConditionalRendering extends LightningElement {
    isShow = false;

    changeHandler(event){
        //this.isShow= true;
        //this.isShow = !this.isShow;
        console.log(event);
        this.isShow = event.detail.checked;
    }
}