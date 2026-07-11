import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetObjectInfoAccount extends LightningElement {
    defaultRtId;

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfoHandler({data, error}){
        if(data){
            console.log(data);
            this.defaultRtId = this.defaultRecordTypeId;
        }
        if(error){
            console.log(result);
        }
    }
}