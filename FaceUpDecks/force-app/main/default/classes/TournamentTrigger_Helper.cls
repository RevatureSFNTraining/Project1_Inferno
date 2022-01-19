public  class TournamentTrigger_Helper {
    public TournamentTrigger_Helper() {
    }

    //Ensures that the tournament has a prize pool
    public static void checkPrize(List<Tournament__c> tournamentList){
        for (Tournament__c t: tournamentList){
            if (t.Prize_Pool__c==null){
                t.Prize_Pool__c.addError('The Tournament requires a Prize Pool');
            }
        }
    }

    //Checks that the tournament rounds are complete
    public static void checkRounds(List<Tournament__c> tournamentList){
        List<Round__c> roundListFull = [SELECT ID, Tournament__c, Completed__c FROM Round__c];
        List<Round__c> roundListCurrent;
        for (Tournament__c t: tournamentList){
            roundListCurrent = null;
            for(Round__c r:roundListFull){
                if(r.Tournament__r == t){
                    roundListCurrent.add(r);
                }
            }
            for(Round__c r: roundListCurrent){
                if(!r.Completed__c){
                    r.Completed__c.addError('The Round is not Complete');
                }
            }
        }
    }

    //Checks to see if the tournament was being updated to be Completed
    //If the tournament is to be marked as complete
    //      Checks that the tournament rounds are complete
    public static void checkCompleteRounds(List<Tournament__c> oldTournamentList, List<Tournament__c> newTournamentList){
        List<Round__c> roundListFull = [SELECT ID, Tournament__c, Completed__c FROM Round__c];
        List<Round__c> roundListCurrent;
        Integer currentIndex;
        Tournament__c pair;
        for (Tournament__c t: oldTournamentList){
            currentIndex = oldTournamentList.indexOf(t);
            pair = newTournamentList[currentIndex];
            if (!t.Completed__c && pair.Completed__c){
                roundListCurrent = null;
                for(Round__c r:roundListFull){
                    if(r.Tournament__r == t){
                        roundListCurrent.add(r);
                    }
                }
                for(Round__c r: roundListCurrent){
                    if(!r.Completed__c){
                        r.Completed__c.addError('The Round is not Complete');
                    }
                }
            }
        }
    }
}
