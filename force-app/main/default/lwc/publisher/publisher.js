import { LightningElement, wire } from 'lwc';
import COUNTER_CHN from '@salesforce/messageChannel/counterChannel__c';
import { MessageContext, publish } from 'lightning/messageService';

export default class Publisher extends LightningElement {
    @wire(MessageContext) messageContext;

    handleAddition(){
        const payload = {
            operator: 'add',
            constant: 1
        };
        publish(this.messageContext, COUNTER_CHN, payload);
    }

    handleSubtraction(){
        const payload = {
            operator: 'subtract',
            constant: 1
        };
        publish(this.messageContext, COUNTER_CHN, payload);
    }

    handleMultiplication(){
        const payload = {
            operator: 'multiply',
            constant: 79998768686867876876876876
        };
        publish(this.messageContext, COUNTER_CHN, payload);
    }
}
