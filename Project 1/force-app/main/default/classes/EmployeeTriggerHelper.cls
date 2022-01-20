public with sharing class EmployeeTriggerHelper {
    public static void reparentOrders(Map<Id, Employee__c> toDelete) {
        Set<Id> keys = toDelete.keySet();
        List<CustomOrder__c> orders = [SELECT Id, CustomorderEmployee__c FROM CustomOrder__c WHERE CustomorderEmployee__c IN :keys];
        for (CustomOrder__c order : orders) {
            Employee__c oldguy = toDelete.get(order.CustomorderEmployee__c);
            order.CustomorderEmployee__c = oldguy.Next_in_Line__c;
        } 
        update orders;
    }
}
