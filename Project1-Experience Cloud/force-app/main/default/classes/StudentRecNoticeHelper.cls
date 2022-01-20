public class StudentRecNoticeHelper {
 
    public void sendEmailToSalesAgent(String mailToAddresses, String sub) {
        
		//Creating new email message
        Messaging.SingleEmailMessage notice = new Messaging.SingleEmailMessage();
       
        notice.toaddresses = new String[] {mailToAddresses};
        notice.setSenderDisplayName('Flipping Moms Team');
        notice.subject = sub;
        notice.setReplyTo('no-reply@flippingmoms.com');
        notice.setUseSignature(false);
        notice.setBccSender(false);
        notice.setSaveAsActivity(true);
        notice.plaintextbody = 'A new info session needs to be created. Please make a new Zoom Meeting and create the info session. Students will be contacted once the info session has been created.';
        
        Messaging.SingleEmailMessage[] notices = new List<Messaging.SingleEmailMessage> {notice};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(notices);
        
        inspectResults(results);
        
    }
    
    //Helper Method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        
        for(Messaging.SendEmailResult res : results){
            if(res.isSuccess()){
                System.debug('Email Status: Sent Successfully!');
            } else {
                sendResult = false;
                System.debug(' Email Status: Email Failed ' + res.getErrors());
            }
        }
        
        return sendResult;
    }
    
}
