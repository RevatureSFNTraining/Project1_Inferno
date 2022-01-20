import { LightningElement , wire, api} from 'lwc';
import getTournaments from '@salesforce/apex/BracketHelper.getTournaments';
import getRoundList from '@salesforce/apex/BracketHelper.getRoundList';

export default class TournamentBracket extends LightningElement {
    currentTournament = 'Default Identifier';
    tournamentMatch = false;
    validRound = false;
    maxColumns = 7;

    @wire (getRoundList) roundList;

    @wire (getTournaments) tournamentList;

    HandleSelection(event){
        this.currentTournament = event.detail;
    }

    CheckTournament(){
        this.tournamentMatch = (tourney.Name == this.currentTournament);
    }

    ValidateRound(){
        if (round.Tournament__r.Name == this.currentTournament){
            if (round.Number__C == int.value){
                this.validRound = true;
            }
        }
    }
}