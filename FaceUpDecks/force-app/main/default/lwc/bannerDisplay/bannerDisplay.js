import { LightningElement, wire } from 'lwc';
import getTournaments from '@salesforce/apex/BracketHelper.getTournaments';

export default class BannerDisplay extends LightningElement {
    @wire(getTournaments) tournamentList;

    HandleSelection(){
        
    }
}