// Israel Escobedo, Project 1, 01/20/2022.
// Helper class creates Billing records.
public class CreateBilling {
    
    // Method creates default records in Billing when a new subscriber is added to Contact.
    public static void createDefaultBilling() {

        // Creates a list that will hold Contact records.
        List<Contact> subscriberList = [SELECT Subscriber_ID__c, Start_Date__c FROM Contact];

        // Creates a list for new Billing records.
        List<Billing__c> billingList;

        // Creates a day object with the current date.
        Date subscriptionDay = Date.today();
        
        // For each loop goes through each Contact record to find a qualifying record  that needs a default Billing record.
        for(Contact subscriber : subscriberList){

            // Checks each Contact record's memebership start date matches today's date in order to create a default Billing record using subscriber contact information.
            if(subscriber.Start_Date__c == subscriptionDay){

                Billing__c billingAcct = new Billing__c();

                billingAcct.Card_Name__c = subscriber.Name;
                billingAcct.Billing_Address__c = subscriber.Address__c;
                billingAcct.Billing_City__c = subscriber.City__c;
                billingAcct.Billing_State_Territory__c = subscriber.State_Territory__c;
                billingAcct.Billing_Zip_Code__c = subscriber.Zip_Code__c;
                billingAcct.Billing_Apt__c = subscriber.Apt__c;
                billingAcct.Card_Type__c = 'Default';
                billingAcct.Credit_Debit_Card_Number__c= 'Not On Record';
                billingAcct.CVV_CVC__c = 'N/A';
                billingAcct.Billing_Status__c = 'Inactive';

                billingList.add(billingAcct);
            }
        }
        // Inserts new records in the Billing object.
        Database.insert(billingList);
    }
}
