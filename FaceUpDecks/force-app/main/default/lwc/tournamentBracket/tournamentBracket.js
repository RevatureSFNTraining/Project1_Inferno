import { LightningElement } from 'lwc';
import BannerDisplay from '../bannerDisplay/bannerDisplay';

export default class TournamentBracket extends LightningElement {
    fullRoundList;
    roundSections;
    currentTournament = BannerDisplay.selectedTournament;
}