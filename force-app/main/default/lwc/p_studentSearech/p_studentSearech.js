import { LightningElement } from 'lwc';
import searchStudent from '@salesforce/apex/StudentCtrl.searchStudent';
const COLUMNS = [
    { label: 'Student Name', fieldName: 'Student_Name__c'},
    { label: 'Class', fieldName: 'Class__c'},
    { label: 'Mobile', fieldName: 'Mobile__c'},
    { label: 'Email', fieldName: 'Email__c', type: 'Email'},
    { label: 'Postal Code', fieldName: 'Postal_Code__c'}
];

export default class P_studentSearech extends LightningElement {
    columnData = COLUMNS;
    studentData;
    error = 'Enter Postal Code to see status';
    searchPostal;
    searchHandler(event){
        this.searchPostal = event.target.value;

        searchStudent({PostalCode: this.searchPostal})
            .then(result => {
                this.studentData = result;
                this.error = undefined;

                if(this.studentData.length == 0){
                    this.studentData = undefined;
                    this.error = 'No Student under this Postal Code Try Again';
                }else{
                    this.error = undefined
                }
            })
            .catch(error=>{
                this.error = error;
            this.studentData = undefined;
            })
    }
}