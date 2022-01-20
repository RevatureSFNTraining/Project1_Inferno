import { LightningElement, api } from 'lwc';

export default class Person extends LightningElement {
    @api name;
    @api picture;
    @api description;
}