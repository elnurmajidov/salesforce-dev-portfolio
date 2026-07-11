import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {

    firstNumber = 0;
    secondNumber = 0;

    handleFirstNumber(event) {
        this.firstNumber = Number(event.target.value);
    }

    handleSecondNumber(event) {
        this.secondNumber = Number(event.target.value);
    }

    get total() {
        return this.firstNumber + this.secondNumber;
    }
}