import {api, LightningElement } from 'lwc';

export default class DisplayResults extends LightningElement {
    @api students;
    @api columns;
    @api error;
}