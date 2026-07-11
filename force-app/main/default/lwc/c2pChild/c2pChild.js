import { LightningElement } from 'lwc';

export default class C2pChild extends LightningElement {
    handleSubtract(){
        const subtractEvent = new CustomEvent('subtraction')
        this.dispatchEvent(subtractEvent);
    }
    handleAdd(){
        const addEvent = new CustomEvent('addition')
        this.dispatchEvent(addEvent);
    }
    handleMultiply(event){
        const valueForMultiply =event.target.value;
        const multiplyEvent = new CustomEvent('multiply',{detail:valueForMultiply})
        this.dispatchEvent(multiplyEvent);
    }
}