import {api,  LightningElement, track, wire } from 'lwc';
import getFoodItemsByMenu from '@salesforce/apex/FusionCallouts.getFoodItemsByMenu';

export default class FusionFoodItemsByMenu extends LightningElement {
    @api category;

    @track foodItems;

    @wire(getFoodItemsByMenu, {category: '$category'})
    foodItemsHandler({data, error}) {
        if(data) {
            const response = JSON.parse(data);
            this.foodItems = response.meals;
        }
        if(error) {
            console.error(error);
        }
    }
}