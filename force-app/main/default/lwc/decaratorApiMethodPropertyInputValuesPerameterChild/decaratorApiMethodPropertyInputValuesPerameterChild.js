import { LightningElement,track,api } from 'lwc';

export default class DecaratorApiMethodPropertyInputValuesPerameterChild extends LightningElement 
{
    @track msg;
    
    @api showmessagemethod(empdetails)
    {
       this.msg = empdetails.name;
    }
}