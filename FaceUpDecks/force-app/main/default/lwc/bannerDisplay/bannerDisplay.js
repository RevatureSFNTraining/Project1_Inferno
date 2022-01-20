import { LightningElement, wire, track, api } from 'lwc';
import getTournaments from '@salesforce/apex/BracketHelper.getTournaments';

export default class BannerDisplay extends LightningElement {
    @wire(getTournaments) tournamentList;

    @track selectedTournament = tournamentList[0].Name;
}