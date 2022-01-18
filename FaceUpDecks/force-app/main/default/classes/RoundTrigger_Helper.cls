public with sharing class RoundTrigger_Helper {
    public RoundTrigger_Helper() {

        //Ensures that the round has an associated Tournament
        public static void ensureTournament(List<Round__c> roundList){
            for (Round__c r: roundList)
            {
                if (r.Tournament__c==null)
                {
                    r.Tournament__c.addError('The round must be associated with a Tournament!');
                }
            }
        }

        //Prevent Deletion if the round is incomplete
        public static void checkComplete(List<Round__c> roundList){
            for (Round__c r: roundList){
                if (!r.Completed__c){
                    r.Completed__c.addError('Cannot delete Tournament Round. Round not Complete!');
                }
            }
        }

        //Prevent Deletion if the tournament is incomplete
        public static void checkTournamentComplete(List<Round__c> roundList){
            for (Round__c r: roundList){
                if (!r.Tournament__c.Completed__c){
                    r.Tournament__c.addError('Cannot delete Tournament Round. Tournament is not Complete!');
                }
            }
        }

        //Checks to see if the round was being Updated as Complete
        //Prevent Update to complete if there is no winner
        public static void checkWinner(List<Round__c> oldRoundList, List<Round__c> newRoundList){
            Integer currentIndex;
            Round__c pair;
            for (Round__c r: oldRoundList){
                currentIndex = oldRoundList.indexOf(r);
                pair = newRoundList[currentIndex];
                if (!r.Completed__c && pair.Completed__c){
                    if (pair.Winner__c==null){
                        pair.Winner__c.addError('Tournament not complete. There is no Winner!');
                    }
                }
            }
        }
    }
}
