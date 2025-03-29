import { LightningElement,track} from 'lwc';

export default class DecoratorTrackComponent extends LightningElement 
{

    @track showcustommessage;
    @track showcustomerdetails;

  /*  trackfun1(event)
    {
       this.showcustommessage = event.target.value
    }
    trackfun2(event)
    {
       this.showcustomerdetails = event.target.value
    }*/
   
    trackfun(event)
    {
       const refid = event.target.name;
       const refprty = event.target.value;

       if(refid==="sname")
       {
          this.showcustommessage = refprty;
       }
       else
       {
         this.showcustomerdetails = refprty;
       }
    }
}