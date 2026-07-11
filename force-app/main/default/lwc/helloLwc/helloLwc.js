import { LightningElement } from 'lwc';

export default class HelloLwc extends LightningElement {
    fullName= "Andy Young";
    age = 30;
    isEmployee = true;
    cities = ['Chicago', 'NewYork', 'Miami'];
    location = {
        city: 'Miami',
        country:'USA'
    }

    num1 = 50;
    num2 = 100;

    get firstItem(){
        return this.cities[0];
    }

    get sum(){
        return this.num1 + this.num2;
    }
}