import { LightningElement, wire } from 'lwc';
import { CurrentPageReference } from "lightning/navigation";
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class OpportunityRecord extends LightningElement {
    currentPageReference = null;
    selectedRowId = null;
    message = "";

    @wire(CurrentPageReference)
    getStateParameters(currentPageReference) {
        if (currentPageReference) {
            this.selectedRowId = currentPageReference.attributes.recordId;
            this.message = "Hello world " + this.selectedRowId.toString() + "!!!"
        }
    }

    handleClick() {
        const evt = new ShowToastEvent({
            title: "French Toast",
            message: this.message,
            variant: "success",
        });
        this.dispatchEvent(evt);
    }
}