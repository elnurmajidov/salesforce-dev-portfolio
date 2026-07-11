import { LightningElement } from 'lwc';

export default class PricingContainer extends LightningElement {
    chosenPlan = 'No plan selected yet';
    choosenPrice = '';

    // 8. QUESTION: Complete the event handler function to catch the child's data
    handlePlanSelection(event) {
        this.chosenPlan = event.detail.selectedPlan;
        this.choosenPrice = event.detail.selectedPrice;
    }
}