import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class GetObjectInfoContact2 extends LightningElement {
    customerRtId;

    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    contactHandler({data, error}){
        if(data){
            console.log(data);
            const rtids = data.recordTypeInfos;
            this.customerRtId = Object.keys(rtids).find(rtid => rtids[rtid].name === 'Customer Contact');
            //Object.keys(rtids) : ['012fj000005QpVRAA0', '012fj000005QpaHAAS', '012000000000000AAA']
            //rtid : '012fj000005QpVRAA0' map.get(key) = value
        }
        if(error){
            console.log(error);
        }
    }
}