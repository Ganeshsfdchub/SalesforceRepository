import { LightningElement,track,api } from 'lwc';

export default class DecaratorApiMethodPropertyHardCodedPerameterChild extends LightningElement 
{

    @track msg;

    @api showmessage(msgperameter)
    {
       this.msg = msgperameter.firstname +''+ msgperameter.lastname;
    } 
}