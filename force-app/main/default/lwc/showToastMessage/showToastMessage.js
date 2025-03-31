import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class ShowToastMessage extends LightningElement 
{

    handleSuccessMessage()
    {
        const success = new ShowToastEvent({
                                             title : 'Success',
                                             message : 'Record has been created successfully',
                                             variant : 'success',
                                             mode : 'sticky'
                                          });
                                          this.dispatchEvent(success);
    }
    handleWarningMessage()
    {
        const warning = new ShowToastEvent({
                                             title : 'Warning',
                                             message : 'Record has been updated successfully',
                                             variant : 'warning',
                                             mode : 'dismissable'
                                          });
                                          this.dispatchEvent(warning);
    }
    handleErrorMessage()
    {
        const error = new ShowToastEvent({
                                             title : 'Error',
                                             message : 'Record has been deleted successfully',
                                             variant : 'error',
                                             mode : 'sticky'
                                          });
                                          this.dispatchEvent(error);
    }
    handleInfoMessage()
    {
        const info = new ShowToastEvent({
                                             title : 'Info',
                                             message : 'Record has been created successfully',
                                             variant : 'info',
                                             mode : 'dismissable'
                                          });
                                          this.dispatchEvent(info);
    }
}