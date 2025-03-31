import { LightningElement,track,api} from 'lwc';

export default class DecaratorApiMethodNonPerameterChild extends LightningElement 
{
    @track msg; 

    @api showmessage()
    {
      this.msg = 'Hi Ganesh How are you';
    }
}