import FIRST_NAME_FIELD from '@salesforce/schema/Lead.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Lead.LastName';
import EMAIL_FIELD from '@salesforce/schema/Lead.Email';
import TITLE_FIELD from '@salesforce/schema/Lead.Title';
import DEPARTMENT_FIELD from '@salesforce/schema/Lead.Department__c';
import COMPANY_FIELD from '@salesforce/schema/Lead.Company';
import { LightningElement, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

const FIELDS = [
    FIRST_NAME_FIELD,
    LAST_NAME_FIELD,
    EMAIL_FIELD,
    TITLE_FIELD,
    DEPARTMENT_FIELD,
    COMPANY_FIELD
];

export default class GetRecordLead extends LightningElement {
    recordId = '00Qfj000007WcfdEAC';

    firstName;
    lastName;
    email;
    title;
    department;
    company;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    leadHandler({ data, error }) {
        if (data) {
            this.firstName = getFieldValue(data, FIRST_NAME_FIELD);
            this.lastName = getFieldValue(data, LAST_NAME_FIELD);
            this.email = getFieldValue(data, EMAIL_FIELD);
            this.title = getFieldValue(data, TITLE_FIELD);
            this.department = getFieldValue(data, DEPARTMENT_FIELD);
            this.company = getFieldValue(data, COMPANY_FIELD);
        }

        if (error) {
            console.error(error);
        }
    }
}
