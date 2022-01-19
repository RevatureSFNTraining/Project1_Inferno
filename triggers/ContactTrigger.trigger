// Israel Escobedo, Project 1, 01/20/2022

trigger ContactTrigger on Contact (after insert) {

    // If a new record is created in Contact create deafult Billing record.
    if(Trigger.isInsert){

        // Calls the method to create default Billing record.
        CreateBilling.createDefaultBilling();
    }
}