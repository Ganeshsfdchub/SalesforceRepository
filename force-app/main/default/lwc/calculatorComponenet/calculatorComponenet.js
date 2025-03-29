import { LightningElement } from 'lwc';

export default class CalculatorComponenet extends LightningElement 
{
   firstnumber;
secondnumber;
Result;

fchange(event)
{
   this.firstnumber = event.target.value;
}
schange(event)
{
   this.secondnumber = event.target.value;
}


addfun()
{
   this.Result = parseInt(this.firstnumber) + parseInt( this.secondnumber);
}
Subfun()
{
   this.Result = parseInt(this.firstnumber) - parseInt( this.secondnumber);
}
Mulfun()
{
   this.Result = parseInt(this.firstnumber) * parseInt( this.secondnumber);
}
Divfun()
{
   if(this.secondnumber>0)
   {
   this.Result = parseInt(this.firstnumber) / parseInt( this.secondnumber);
   }
   else
   {
      alert('Division Not perfomed second number value is Zeero')  
   }
}
Modfun()
{
   this.Result = parseInt(this.firstnumber) % parseInt( this.secondnumber);
}

}