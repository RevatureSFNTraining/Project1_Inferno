trigger TournamentBadgeTrigger on Tournament_Badge__c (before insert) {
    TournamentBadgeTrigger_Helper.checkTournament(Trigger.new);
    TournamentBadgeTrigger_Helper.checkRound(Trigger.new);
}