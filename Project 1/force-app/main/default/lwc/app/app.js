import { LightningElement } from 'lwc';

export default class App extends LightningElement {
    aboutUsSelected=true;
    testimonialsSelected=false;
    catalogSelected=false;
    contactUsSelected=false;

    handleClick(event){
        this.aboutUsSelected=false;
        this.testimonialsSelected=false;
        this.catalogSelected=false;
        this.contactUsSelected=false;
        console.log(event.target.title);
        switch(event.target.title){
            case "aboutUs":
                this.aboutUsSelected=true;
                break;
            case "catalog":
                this.catalogSelected=true;
                break;
            case "contactUs":
                this.contactUsSelected=true;
                break;
            case "testimonials":
                this.testimonialsSelected=true;
                break;
        }
    }

}