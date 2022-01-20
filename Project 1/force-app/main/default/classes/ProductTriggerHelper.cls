public class ProductTriggerHelper{

    public static void createInventories(List<Product2> newProducts){
        List<Schema.Location> locs = [SELECT Name, Id FROM Location];
        List<Inventory__c> inventoriesToCreate = new List<Inventory__c>();

        for (Schema.Location loc : locs) {
            for (Product2 pro : newProducts) {
                Inventory__c newInv = new Inventory__c();
                newInv.InventoryLocation__c = loc.Id;
                newInv.InventoryProduct__c = pro.Id;
                inventoriesToCreate.add(newInv);
            }
        }
        insert inventoriesToCreate;
    }

    public static void deleteInventories(Map<Id, Product2> toDelete){
        Set<Id> keys = toDelete.keySet();
        List<Inventory__c> inventories = [SELECT Id, InventoryProduct__c FROM Inventory__c WHERE InventoryProduct__c IN :keys];
        delete inventories;
    }

}
