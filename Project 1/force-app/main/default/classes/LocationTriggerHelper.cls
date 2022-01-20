public class LocationTriggerHelper {
    public static void createInventories(List<Schema.Location> newLocs){
        List<Product2> prods = [SELECT Name, Id FROM Product2];
        List<Inventory__c> inventoriesToCreate = new List<Inventory__c>();

        for (Product2 prod : prods) {
            for (Schema.Location loc : newLocs) {
                Inventory__c newInv = new Inventory__c();
                newInv.InventoryLocation__c = loc.Id;
                newInv.InventoryProduct__c = prod.Id;
                inventoriesToCreate.add(newInv);
            }
        }
        insert inventoriesToCreate;
    }
}
