trigger EmployeeTrigger on Employee__c (before delete) {
    if (Trigger.isDelete){
        EmployeeTriggerHelper.reparentOrders(Trigger.oldMap);
    }

}