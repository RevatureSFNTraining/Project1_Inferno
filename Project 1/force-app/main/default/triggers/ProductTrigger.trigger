trigger ProductTrigger on Product2 (after insert, before delete) {
    if (Trigger.isInsert){
        ProductTriggerHelper.createInventories(Trigger.new);
    }
    if (Trigger.isDelete){
        ProductTriggerHelper.deleteInventories(Trigger.oldMap);
    }
}