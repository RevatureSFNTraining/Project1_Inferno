trigger LocationTrigger on Schema.Location (after insert) {
    if (Trigger.isInsert){
        LocationTriggerHelper.createInventories(Trigger.new);
    }
}