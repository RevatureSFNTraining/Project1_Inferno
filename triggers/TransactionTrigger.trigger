// Israel Escobedo, Project 1, 01/20/2022
trigger TransactionTrigger on 	Transactions__c (after update) {

    // If a Transaction record's status is updated to active, a matching Shipment record's shipement approval is updated to approved.
    if(Trigger.isUpdate){
        
        // The updateShipmentApproval method is called to make the update in the Shipment record.
        UpdateShipment.updateShipmentApproval();
    }
}