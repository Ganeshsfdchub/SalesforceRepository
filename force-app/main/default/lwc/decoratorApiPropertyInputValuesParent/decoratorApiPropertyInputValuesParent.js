import { LightningElement,track } from 'lwc';

export default class DecoratorApiPropertyInputValuesParent extends LightningElement 
{
    @track parentvarible;
    @track butnvarible;
    
   
        hndlinput(event)
        {                    
              this.parentvarible = event.target.value;      
        }
        hndlbutn()
        {
              this.butnvarible = this.parentvarible;
        }
}