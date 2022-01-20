import { LightningElement } from 'lwc';
import BannerDisplay from '../bannerDisplay/bannerDisplay';

export default class TournamentCard extends LightningElement {
    tournamentIcon;
    tournamentName = 'Default Tournament';
    tournamentTotalSlots = 0;
    tournamentFilledSlots = 0;

    DisplayBracket(){
        BannerDisplay.selectedTournament = this.tournamentName;
    }
}