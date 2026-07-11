import { LightningElement, wire } from 'lwc';
import COUNTER_CHN from '@salesforce/messageChannel/counterChannel__c';
import { MessageContext, subscribe, APPLICATION_SCOPE } from 'lightning/messageService';

export default class Subscreiber extends LightningElement {
    counter = 0;
    subscription;

    @wire(MessageContext) messageContext;

    connectedCallback(){
        this.subscribeToMessageChannel();
    }

    renderedCallback(){
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel(){
        if(this.messageContext && !this.subscription){
            this.subscription = subscribe(
                this.messageContext,
                COUNTER_CHN,
                (message) => this.handleSubscribe(message),
                { scope: APPLICATION_SCOPE }
            );
        }
    }

    handleSubscribe(message){
        if(message.operator === 'add'){
            this.counter += message.constant;
        } else if(message.operator === 'subtract'){
            this.counter -= message.constant;
        } else if(message.operator === 'multiply'){
            this.counter *= message.constant;
        }
    }
}
