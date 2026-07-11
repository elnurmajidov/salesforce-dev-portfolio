import { LightningElement } from 'lwc';

export default class ComboBoxHomework extends LightningElement {

    selectedValue = 'False';
    showMessage = false;

    options = [
        { label: 'Display the message', value: 'True' },
        { label: 'Hide the message', value: 'False' }
    ];

    handleChange(event) {
        this.selectedValue = event.detail.value;

        if (this.selectedValue === 'True') {
            this.showMessage = true;
        } else {
            this.showMessage = false;
        }
    }
}