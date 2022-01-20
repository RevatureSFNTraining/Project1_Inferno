public class BracketHelper {
    public BracketHelper() {
    }

    @AuraEnabled(cacheable = true)
    public static List<Round__c> getRoundList(){
        try {
            return [SELECT Id, Participant_1__c, Participant_2__c, Winner__c, Tournament__c FROM Round__c];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static List<Round__c> getTournamentRounds(Tournament__c searchTourney){
        try {
            return [SELECT Id, Participant_1__c, Participant_2__c, Winner__c, Tournament__c FROM Round__c WHERE Tournament__c =: searchTourney.ID];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable = true)
    public static List<Round__c> getTournamentRounds(String searchString){
        try {
            return [SELECT Id, Participant_1__c, Participant_2__c, Winner__c, Tournament__c FROM Round__c WHERE Tournament__r.Name =: searchString];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<Tournament__c> getTournaments(){
        try {
            return [SELECT Id, Name, Slots__c, Entrants__c, Completed__c, Banner_Icon__c FROM Tournament__c WHERE Completed__c = false];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
