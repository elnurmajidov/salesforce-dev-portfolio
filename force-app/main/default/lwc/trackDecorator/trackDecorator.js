import { api, LightningElement, track, wire } from 'lwc';

export default class TrackDecorator extends LightningElement {
    @track
    user={
        firstName :"Andy",
        lastName:"Young"
    }
    handleClick(){
        console.log("Function çalıştı");

     //   this.user ={
       //     firstName :"Ali",
       //     lastName:"Kaya"
        //   }

       this.user.firstName="Veli";
       console.log( this.user.firstName);

    }
}