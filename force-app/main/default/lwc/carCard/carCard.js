import { LightningElement, wire } from 'lwc';
import { subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import CAR_SELECTED_CHANNEL from '@salesforce/messageChannel/CarSelected__c';
import NAME_FIELD from '@salesforce/schema/Car__c.Name';
import PICTURE_URL_FIELD from '@salesforce/schema/Car__c.Picture_URL__c';

export default class CarCard extends LightningElement {
    recordId;
    subscription = null;

    @wire(MessageContext)
    messageContext;

    @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD, PICTURE_URL_FIELD] })
    car;

    get carName() {
        return getFieldValue(this.car.data, NAME_FIELD);
    }

    get pictureUrl() {
        return getFieldValue(this.car.data, PICTURE_URL_FIELD);
    }

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    disconnectedCallback() {
        unsubscribe(this.subscription);
        this.subscription = null;
    }

    subscribeToMessageChannel() {
        if (!this.subscription) {
            this.subscription = subscribe(
                this.messageContext,
                CAR_SELECTED_CHANNEL,
                (message) => this.handleCarSelected(message)
            );
        }
    }

    handleCarSelected(message) {
        this.recordId = message.carId;
    }
}
