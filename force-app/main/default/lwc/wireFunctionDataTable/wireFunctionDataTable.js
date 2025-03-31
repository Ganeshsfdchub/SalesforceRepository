import { LightningElement,track,wire } from 'lwc';
import mywiremethod from '@salesforce/apex/mywireservice.mywiremethod';
export default class WireFunctionDataTable extends LightningElement 
{

    @track clm = [{label:'Name',fieldName:'Name',type:'text'},
        {label:'Rating',fieldName:'Rating',type:'text'},
        {label:'Industry',fieldName:'ndustry',type:'text'},
        {label:'Phone',fieldName:'Phone',type:'phone'},
        {label:'AnnualRevenue',fieldName:'AnnualRevenue',type:'currency'},
        {label:'Fax',fieldName:'Fax',type:'text'},
        {label:'Active',fieldName:'Active__c',type:'boolean'}];


    @track numbrs;
    @track accnts;

   @wire(mywiremethod)myfunction({data,error})
   {
      if(data)
      {
          this.accnts = data;
          this.numbrs =data.length;
      }
      else if(error)
      {

         this.accnts = error;
      }
   }
}
