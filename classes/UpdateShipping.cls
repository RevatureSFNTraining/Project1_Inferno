// Israel Escobedo, Project 1, 01/20/2022.
// Helper class updates Shipment records.
public class UpdateShipping {

    // Method updates the Shipment approval field in the Shipments records.
    public static void updateShipmentApproval() {

            // New list holds records from Transactions that have Transaction staus = Approved.
            List<Transactions__c> transactionList = [SELECT Subscriber_ID__c, Transaction_Status__c FROM Transactions__c 
            WHERE Transaction_Status__c ='Approved'];

            // New list holds records from Shipment records that have their Shipment approval = Pending and Shipment status = Not shipped.
            List<Shipments__c> shipmentList = [SELECT Subscriber_ID__c, Shipment_Approval__c, Shipping_Status__c FROM Shipments__c
            WHERE Shipment_Approval__c ='Pending' AND Shipping_Status__c ='Not Shipped'];

            // Transaction records with the Transaction status = Approved will have its corresponding record in Shipments updated by matching the Subscriber IDs.
            for(Transactions__c transction : transactionList){

                if(transction.Transaction_Status__c=='Approved'){

                   for(Shipments__c shipment : shipmentList){
                    
                       // If the Subscriber ID match, the Shipment approval field is changed to Approve Shipment record.
                       if(transction.Subscriber_ID__c == shipment.Subscriber_ID__c){
                           shipment.Shipment_Approval__c ='Approved';
                       }
                   }
                }
            }

            // Updates the Shipment records.
            Database.update(shipmentList);
    }
}
