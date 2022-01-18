trigger RoundTrigger on Round__c (before insert, before delete, before update) {
    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            RoundTrigger_Helper.ensureTournament(Trigger.new);
        }
        when BEFORE_DELETE {
            RoundTrigger_Helper.checkComplete(Trigger.new);
            RoundTrigger_Helper.checkTournamentComplete(Trigger.new);
        }
        when BEFORE_UPDATE {
            RoundTrigger_Helper.checkWinner(Trigger.old, Trigger.new);
        }
    }
}