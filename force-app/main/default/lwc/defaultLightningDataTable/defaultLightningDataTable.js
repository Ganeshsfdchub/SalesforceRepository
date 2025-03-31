import { LightningElement,track } from 'lwc';
import getaccountRecordsMethod from '@salesforce/apex/GetAccountRecordsDataTable.getaccountRecordsMethod';
export default class DefaultLightningDataTable extends LightningElement 
{

    @track accnts;
    @track numbr_of_records;
    //@track datalst=[];

    @track clms = [ 
                   {label: 'Account Name', fieldName: 'Name', type:'text'},
                   {label: 'Account Rating', fieldName: 'Rating', type:'text'},
                   {label: 'Account Industry', fieldName: 'Industry', type:'text'},
                   {label: 'Account Phone', fieldName: 'Phone', type:'phone'},
                   {label: 'Account Fax', fieldName: 'Fax', type:'text'},
                   {label: 'AnnualRevenue', fieldName: 'AnnualRevenue', type:'currency'},
                   {label: 'Active', fieldName: 'Active__c', type:'boolean'}
                 ];


        connectedCallback()
        {
           this.getaccounts();
        }
        getaccounts()
        {
            getaccountRecordsMethod()
            .then(result =>{
                
                             this.accnts = result;
                             this.numbr_of_records = result.length;
                             console.log('Result is '+ result);  

                           })

              .catch(error =>{
                                this.accnts = error;
                                console.log('Error is '+ error);

                             })             
        }
}