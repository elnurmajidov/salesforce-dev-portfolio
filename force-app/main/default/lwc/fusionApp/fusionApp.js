import { LightningElement } from 'lwc';

export default class FusionApp extends LightningElement {
    selectedCategory;

    handleSelectedCategory(event){
        this.selectedCategory = event.detail;
    }
}