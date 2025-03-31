import { LightningElement,track } from 'lwc';

export default class QuerySelector extends LightningElement 
{
    @track myvarible;

    handlesubmit()
    {
       // Based on Tag
      // this.myvarible = this.template.querySelector('lightning-input').value;

       // Based On class
      // this.myvarible = this.template.querySelector('.myclass').value;

      // Based On Tag & class
       this.myvarible = this.template.querySelector('lightning-input.myclass').value;


    }
}