import { LightningElement,track,wire } from 'lwc';
import mywiremethod from '@salesforce/apex/mywireservice.mywiremethod';
export default class WireFunctionLtngCard extends LightningElement 
{

    @track numbrs;
    @track accnts;

    @wire(mywiremethod)accfuntion({data,error})
   {
      if(data)
      {
          this.accnts = data;
          this.numbrs =data.length;
      }
      else if(error)
      {
         console.log(error);
      }
   }
}