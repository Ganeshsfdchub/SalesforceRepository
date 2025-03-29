import { LightningElement } from 'lwc';

export default class DecaratorApiMethodPropertyHardCodedPerameterParent extends LightningElement 
{

    hndlshwmsg()
    {
        var smsmge = this.template.querySelector('c-decarator-api-method-property-hard-coded-perameter-child');
        var msgnames = {'firstname':'Ganesh', 'lastname':'Chinthakindi'};
        smsmge.showmessage(msgnames);
    }  
}