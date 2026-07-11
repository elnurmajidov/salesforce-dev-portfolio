import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Recipe__c.Name';
import TAGS_FIELD from '@salesforce/schema/Recipe__c.Tags__c';
import INSTR_FIELDS from '@salesforce/schema/Recipe__c.Instructions__c';
import INGR_FIELD from '@salesforce/schema/Recipe__c.Ingredients__c';
import { getFieldValue, getRecord } from 'lightning/uiRecordApi';

const FIELDS = [NAME_FIELD, TAGS_FIELD, INSTR_FIELDS, INGR_FIELD];

export default class GetRecordRecipe extends LightningElement {
    recordId = "a0Lfj00000AApbNEAT";

    name;
    tags;
    ingredients;
    instructions;

    /** Aproach 1 */
    /*
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    recordHandler({data, error}){
        if(data){
            console.log(data);
            this.name = data.fields.Name.value;
            this.tags = data.fields.Tags__c.value;
            this.ingredients = data.fields.Ingredients__c.value;
            this.instructions = data.fields.Instructions__c.value;
        }
        if(error){
            console.error(error);
        }
    }
    */

    /** Aproach 2 */
    @wire(getRecord, {recordId: '$recordId', fields: FIELDS})
    recordHandler({data, error}){
        if(data){
            console.log(data);
            this.name = getFieldValue(data, NAME_FIELD);
            this.tags = getFieldValue(data, TAGS_FIELD);
            this.ingredients = getFieldValue(data, INGR_FIELD);
            this.instructions = getFieldValue(data, INSTR_FIELDS);
        }
        if(error){
            console.error(error);
        }
    }
}
