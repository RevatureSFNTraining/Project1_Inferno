import { LightningElement } from 'lwc';

export default class RoundCard extends LightningElement {
    participant_1 = 'Home Team';
    participant_2 = 'Away Team';
    winner = 'No Contest';
    completed = false;
}