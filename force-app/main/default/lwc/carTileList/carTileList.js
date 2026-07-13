import { LightningElement, wire } from 'lwc';
import { publish, subscribe, unsubscribe, MessageContext } from 'lightning/messageService';
import CARS_FILTERED_CHANNEL from '@salesforce/messageChannel/CarsFiltered__c';
import CAR_SELECTED_CHANNEL from '@salesforce/messageChannel/CarSelected__c';
import getCars from '@salesforce/apex/CarController.getCars';

export default class CarTileList extends LightningElement {
    category = 'All';
    selectedCarId;
    cars;
    error;
    subscription = null;

    @wire(MessageContext)
    messageContext;

    @wire(getCars, { category: '$category' })
    wiredCars({ data, error }) {
        if (data) {
            this.cars = data;
            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.cars = undefined;
        }
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
                CARS_FILTERED_CHANNEL,
                (message) => this.handleFilterMessage(message)
            );
        }
    }

    handleFilterMessage(message) {
        this.category = message.category;
    }

    handleCarSelect(event) {
        this.selectedCarId = event.detail;
        publish(this.messageContext, CAR_SELECTED_CHANNEL, {
            carId: this.selectedCarId
        });
    }
}
