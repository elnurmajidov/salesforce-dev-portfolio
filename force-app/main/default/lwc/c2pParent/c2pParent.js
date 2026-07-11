import { LightningElement } from 'lwc';

export default class C2pParent extends LightningElement {
    counter=0;
    handleSubtraction(){
        this.counter = this.counter -1;
    }
    handleAddition(){
        this.counter = this.counter +1;
    }
    handleMultiplication(event){
        const multplyValue = event.detail;
        this.counter = this.counter * multplyValue;
    }
}