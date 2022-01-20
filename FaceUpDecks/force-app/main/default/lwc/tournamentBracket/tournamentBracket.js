import { LightningElement , wire, api} from 'lwc';
import getTournaments from '@salesforce/apex/BracketHelper.getTournaments';
import getRoundList from '@salesforce/apex/BracketHelper.getRoundList';

export default class TournamentBracket extends LightningElement {
    currentTournament = 'Default Identifier';

    @wire (getRoundList) roundList;

    @wire (getTournaments) tournamentList;

    HandleSelection(event){
        this.currentTournament = event.detail;
    }
}