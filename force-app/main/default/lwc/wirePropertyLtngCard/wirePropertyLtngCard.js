import { LightningElement,track,wire } from 'lwc';
import wiremethod from '@salesforce/apex/AccountHelper.wiremethod';
export default class WirePropertyLtngCard extends LightningElement 
{

    @track wireproperty;


   @wire(wiremethod)wireproperty;
}