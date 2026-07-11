import { LightningElement, api } from 'lwc'; // 3. QUESTION: Which decorator do we need?

export default class PricingCard extends LightningElement {
    // 4. QUESTION: Expose these properties to the parent component
    @api planName;
    @api planPrice;

    handleCardClick() {
        // 5. QUESTION: Create and dispatch a Custom Event named 'planselect' 
        // and pass 'planName' inside the detail object.
        const selectEvent = new CustomEvent('planselect', {
            detail: { selectedPlan: this.planName, selectedPrice: this.planPrice }
        });
        
        this.dispatchEvent(selectEvent);
        
    }
}