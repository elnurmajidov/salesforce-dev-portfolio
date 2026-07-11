import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    fullname = "Elnur"; //String
    age = 30; //number
    location = {
        city: "Pittsburgh",
        country: "USA"
    }; //object
    fruits = ["Apple", "Banana", "Grape", "Orange"]; //array
}