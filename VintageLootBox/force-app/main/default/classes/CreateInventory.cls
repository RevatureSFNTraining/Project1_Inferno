// Israel Escobedo, Project 1, 01/20/2022.
// Helper class adds records to Inventory.
public class CreateInventory {
    
    // The method creates 10 default Inventory records.
    public static void addInventory() {

        // Creates a list to store the new Inventory records.
        List<Inventory__c> productList = new List<Inventory__c>();
        
        // Variable that holds the number of records to be created.
        Integer count = 10;

        // For loop creates inventory records with default values.
        for(Integer i=0; i<count; i++){
            Inventory__c product = new Inventory__c();

            product.Product_Name__c = 'Product' + (i+1);
            product.Product_Category__c = 'Other';
            product.Brand__c = 'No Brand';
            product.Manufacturer__c = 'No Manufacturer';
            product.Year__c ='N/A';
            product.Price__c =0;
            product.Quantity__c=0;
            product.Product_Weight_Lbs__c= 0;
            product.Serial_No__c = 'No Serial No';
            product.ISBN__c = 'No ISBN';
            product.UPC__c ='No UPC';
            
            productList.add(product);
        }
        // Adds records to the Inventory object.    
        Database.insert(productList);
    }
}
