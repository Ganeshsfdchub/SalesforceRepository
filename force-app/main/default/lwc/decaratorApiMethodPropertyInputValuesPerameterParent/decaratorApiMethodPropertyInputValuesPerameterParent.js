import { LightningElement,track,api } from 'lwc';

export default class DecaratorApiMethodPropertyInputValuesPerameterParent extends LightningElement 
{

    @track inputvarible;

    hndlvlue(event)
    {
        this.inputvarible = event.target.value;
    } 
    bunhandl()
    {
        var methodmeesge = this.template.querySelector('c-decarator-api-method-property-input-values-perameter-child');
        var details = {'name':this.inputvarible};
        methodmeesge.showmessagemethod(details);
    }
}