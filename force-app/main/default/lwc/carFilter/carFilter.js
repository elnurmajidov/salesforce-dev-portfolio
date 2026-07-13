import { LightningElement, wire } from 'lwc';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { publish, MessageContext } from 'lightning/messageService';
import CARS_FILTERED_CHANNEL from '@salesforce/messageChannel/CarsFiltered__c';
import CAR_OBJECT from '@salesforce/schema/Car__c';
import CATEGORY_FIELD from '@salesforce/schema/Car__c.Category__c';

export default class CarFilter extends LightningElement {
    selectedCategory = 'All';
    categoryOptions = [];

    @wire(MessageContext)
    messageContext;

    @wire(getObjectInfo, { objectApiName: CAR_OBJECT })
    carObjectInfo;

    @wire(getPicklistValues, {
        recordTypeId: '$carObjectInfo.data.defaultRecordTypeId',
        fieldApiName: CATEGORY_FIELD
    })
    wiredCategoryPicklist({ data, error }) {
        if (data) {
            this.categoryOptions = [
                { label: 'All', value: 'All' },
                ...data.values.map((item) => ({ label: item.label, value: item.value }))
            ];
        } else if (error) {
            console.error('Error loading category picklist values', error);
        }
    }

    handleCategoryChange(event) {
        this.selectedCategory = event.detail.value;
        publish(this.messageContext, CARS_FILTERED_CHANNEL, {
            category: this.selectedCategory
        });
    }
}
