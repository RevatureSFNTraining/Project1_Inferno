trigger StudentRecNotice on Student__c (after insert, after update) {

   List<Student__c> pendrecList = [SELECT Name FROM Student__c WHERE Enrollment_Status__c = 'Pending Approval' AND Instructor__c = null];
    Integer listSize = pendrecList.size();
    
    if (listSize >= 10) {
       
        StudentRecNoticeHelper mail = new StudentRecNoticeHelper();
        mail.sendEmailToSalesAgent('achaymbiong@gmail.com','Info Session Required');
    }

}