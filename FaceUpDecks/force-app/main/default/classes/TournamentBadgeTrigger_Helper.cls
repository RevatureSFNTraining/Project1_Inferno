public with sharing class TournamentBadgeTrigger_Helper {
    public TournamentBadgeTrigger_Helper() {

        //Ensures that the Badge is associated with a Tournament
        public static void checkTournament(List<Tournament_Badge__c> badgeList){
            for (Tournament_Badge__c b: badgeList){
                if(b.Tournament__c==null){
                    b.Tournament__c.addError('Must be associated with a Tournament!');
                }
            }
        }

        //Ensures that each Participant is associated with a Round
        public static void checkRound(List<Tournament_Badge__c> badgeList){
            List<Round__c> roundList = [SELECT ID, Tournament__c, Participant_1__c, Participant_2__c FROM Round__c];
            Boolean roundFound = false;
            for(Tournament_Badge__c b: badgeList){
                for(Round__c r: roundList){
                    if(b == r.Participant_1__c || b == r.Participant_2__c){
                        roundFound = true;
                    }
                }
                if (!roundFound){
                    b.Participant.addError('No such Participant found in Tournament Rounds!');
                }
            }
        }
    }
}
