import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    num1;
    num2;
    result;


    changeHandler1(event){
        this.num1 = event.target.value;
    }

    changeHandler2(event){
        this.num2 = event.target.value;
    }
    get showButton(){
        if(this.num1 && this.num2){
            return true;
        }
        return false;
    }

    sumHandler(){
        this.result = Number(this.num1) + Number(this.num2);
    }
}