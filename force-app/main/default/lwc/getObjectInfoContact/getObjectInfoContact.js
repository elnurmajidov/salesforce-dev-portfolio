import CONTACT_OBJ from '@salesforce/schema/Contact';
import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';


export default class GetObjectInfoContact extends LightningElement {
    contactCanadaRtId;
    condefaultRecordTypeID;

    @wire(getObjectInfo, { objectApiName : CONTACT_OBJ})
    objectInfoHandler({data,error}){
        if(data){
            console.log('Contact Info', data);
            const rtIds = data.recordTypeInfos;
            const arrIds= Object.keys(rtIds);//['','','']
            this.contactCanadaRtId = arrIds.find(eachRtId =>rtIds[eachRtId].name === 'CANADA' )

            this.condefaultRecordTypeID = data.defaultRecordTypeId;
        }
    }
}