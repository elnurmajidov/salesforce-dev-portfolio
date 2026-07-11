import { LightningElement, track, wire} from 'lwc';
import getMenuItems from '@salesforce/apex/FusionCallouts.getMenuItems';

export default class FusionCategories extends LightningElement {
    @track categories = [];

    @wire(getMenuItems)
    menuHandler({data, error}){
        if(data){
            const response = JSON.parse(data);
            this.categories = response.categories;
        }
        if(error){
            console.error(error);
        }
    }

    handleCategorySelect(event){
        const selectedCategory = event.currentTarget.dataset.id;
        console.log(selectedCategory);

        // Notif Parent about the selected category
        const evt = new CustomEvent('select', {detail: selectedCategory});
        this.dispatchEvent(evt);
    }
}