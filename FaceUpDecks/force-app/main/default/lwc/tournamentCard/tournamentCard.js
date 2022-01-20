import { LightningElement } from 'lwc';

export default class TournamentCard extends LightningElement {
    tournamentIcon;
    tournamentName = 'Default Tournament';
    tournamentTotalSlots = 0;
    tournamentFilledSlots = 0;

    PickTournament(){
        const tournamentSelection = new CustomEvent('selection', {detail: this.tournamentName});
        this.dispatchEvent(tournamentSelection);
    }
}