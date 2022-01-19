trigger TournamentTrigger on Tournament__c (before insert, before delete, before update) {
    switch on Trigger.OperationType {
        when BEFORE_INSERT {
            TournamentTrigger_Helper.checkPrize(Trigger.new);
        }
        when BEFORE_DELETE {
            TournamentTrigger_Helper.checkRounds(Trigger.new);
        }
        when BEFORE_UPDATE {
            TournamentTrigger_Helper.checkCompleteRounds(Trigger.old, Trigger.new);
        }
    }
}