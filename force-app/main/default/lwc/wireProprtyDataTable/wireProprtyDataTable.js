import { LightningElement,track,wire } from 'lwc';
import wiremethod from '@salesforce/apex/AccountHelper.wiremethod';
export default class WireProprtyDataTable extends LightningElement 
{
    @track clms = [ {label: 'Account Name', fieldName: 'Name', type:'text'},
        {label: 'Account Rating', fieldName: 'Rating', type:'text'},
        {label: 'Account Industry', fieldName: 'Industry', type:'text'},
        {label: 'Account Phone', fieldName: 'Phone', type:'phone'},
        {label: 'Account Fax', fieldName: 'Fax', type:'text'},
        {label: 'AnnualRevenue', fieldName: 'AnnualRevenue', type:'currency'},
        {label: 'Active', fieldName: 'Active__c', type:'boolean'}
      ];

@track wireproperty;

@wire(wiremethod)wireproperty;
}