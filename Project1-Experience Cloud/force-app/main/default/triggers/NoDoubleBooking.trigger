trigger NoDoubleBooking on Coaching_Session__c (before insert, before update) {
  //Get the new session start date and instructor info
  List<Coaching_Session__c> bookedSession = [SELECT Id,Start_Date__c,Instructor__c FROM Coaching_Session__c WHERE Id NOT IN:trigger.new];

  //Create an empty list for disputed sessions
  List<Coaching_Session__c> disputed = new List<Coaching_Session__c>();

  for(Coaching_Session__c sess : trigger.new) {
    for(Coaching_Session__c booksess : bookedSession) {
      if(sess.Start_Date__c == booksess.Start_Date__c && sess.Instructor__c == booksess.Instructor__c) {
        disputed.add(sess);
      }
    }

    if(!disputed.isEmpty()) {
      sess.addError('This instructor is booked for another coaching/info session at that time.');
    }
  }

}