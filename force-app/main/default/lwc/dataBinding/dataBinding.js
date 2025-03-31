import { LightningElement,track } from 'lwc';

export default class DataBinding extends LightningElement 
{

    msg = 'Im from JS oneway databing';//oneway binding variable
    @track greetings = 'Hi, Welcome to twoway binding'; // twoway binding varible;
    

    hndleproprty(event)
    {
       this.greetings = event.target.value;
    }
}