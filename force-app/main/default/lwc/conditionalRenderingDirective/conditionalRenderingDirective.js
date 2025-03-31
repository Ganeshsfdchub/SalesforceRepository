import { LightningElement, track} from 'lwc';

export default class ConditionalRenderingDirective extends LightningElement 
{

  @track isShow = false;
  @track toogletext = false;

    handleclick()
    {
       this.isShow = true;
    }
    handlehideclick()
    {
        this.isShow = false;
    }
    get handltooglelabel()
    {
        return this.toogletext ? 'Hide Text': 'Show Text';
    }

    tooglebtnhndltext()
    {
       this.toogletext = !this.toogletext; 
    }

}