import { LightningElement } from 'lwc';

export default class TemplateLooping2 extends LightningElement {
    accounts = [
        {
            Id: 1,
            Name: "Universal Containers",
            Type: "New Account",
            Industry: "Education",
            AnnualRevenue: 2000000
        },
        {
            Id: 2,
            Name: "Soft Innovas",
            Type: "Existing Account - Upgarde",
            Industry: "Education",
            AnnualRevenue: 1000000
        },
        {
            Id: 3,
            Name: "SF Academy",
            Type: "New Account",
            Industry: "Energy",
            AnnualRevenue: 3000000
        }
    ];
}