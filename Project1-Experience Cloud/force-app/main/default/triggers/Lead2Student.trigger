trigger Lead2Student on Lead (after insert) {
    
    List<Student__c> sturec = new List<Student__c>();
    
    for(Lead l : trigger.new) {
        
        if(l.Status == 'Open - Not Contacted' && l.ProductInterest__c == 'Coaching (1-on-1)' || l.Status == 'Open - Not Contacted' && l.ProductInterest__c == 'Coaching Sessions (Group)') {
            
            Student__c srec = new Student__c();
            srec.Name = l.FirstName + ' ' +l.LastName;
            System.debug(srec.Name);
            srec.Student_Email__c = l.Email;
            srec.Primary_Phone_Number__c = l.Phone;
            sturec.add(srec);
            
        } 
    }
    
    insert sturec;
}