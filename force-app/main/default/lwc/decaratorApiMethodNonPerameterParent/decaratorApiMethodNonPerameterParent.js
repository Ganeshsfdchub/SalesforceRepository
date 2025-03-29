import { LightningElement,track,api } from 'lwc';

export default class DecaratorApiMethodNonPerameterParent extends LightningElement 
{
    hndlshwmsg()
    {
        var showms = this.template.querySelector('c-decarator-api-method-non-perameter-child');
        showms.showmessage();
    }
              
}