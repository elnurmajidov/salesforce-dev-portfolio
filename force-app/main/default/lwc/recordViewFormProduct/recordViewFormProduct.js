import { LightningElement } from 'lwc';
import PRODUCT_OBJECT from '@salesforce/schema/Product__c';
import NAME_FIELD from '@salesforce/schema/Product__c.Name';
import BRAND_FIELD from '@salesforce/schema/Product__c.Brand__c';
import CATEGORY_FIELD from '@salesforce/schema/Product__c.Category__c';
import DESC_FIELD from '@salesforce/schema/Product__c.Description__c';
import PRICE_FIELD from '@salesforce/schema/Product__c.Price__c';
import RATING_FIELD from '@salesforce/schema/Product__c.Rating__c';

export default class RecordViewFormProduct extends LightningElement {
    objectName = PRODUCT_OBJECT;
    recordId = 'a02fj00000Pb11yAAB';
    fields = {
        name: NAME_FIELD,
        brand: BRAND_FIELD,
        category: CATEGORY_FIELD,
        desc: DESC_FIELD,
        price: PRICE_FIELD,
        rating: RATING_FIELD
    };
}
