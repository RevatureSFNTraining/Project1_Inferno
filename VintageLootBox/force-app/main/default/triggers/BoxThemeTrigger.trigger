// Israel Escobedo, Project 1, 01/20/2022.

trigger BoxThemeTrigger on Box_Themes__c (after insert) {

    // If a new Box Theme record is created, the addProduct method is called.
    if(Trigger.isInsert){

        //Call the addProduct method to create 10 default records in Inventory object.
        CreateInventory.addInventory();
    }
}