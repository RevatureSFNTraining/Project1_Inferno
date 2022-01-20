import { LightningElement } from 'lwc';
import FM_Resources from '@salesforce/resourceUrl/FM_Resources';

export default class HomeHero extends LightningElement {

  image1 = FM_Resources + '/home-hero.JPG';
  image2 = FM_Resources + '/about-us-resized.jpg';
  image3 = FM_Resources + '/mary-paint.jpg';
}