// Israel Escobedo, Project 1, 01/20/2022
import { LightningElement } from 'lwc';
import images1 from '@salesforce/resourceUrl/images1';
import images2 from '@salesforce/resourceUrl/images2';
import images3 from '@salesforce/resourceUrl/images3';

export default class Vintage extends LightningElement {

    // Static resources for images.
    imgLogo = images1 + '/VLBLogos/VLB_Logo.png';
    imgBlueBox = images1 + '/VLBLogos/BlueBox.png';
    imgGreenBox = images1 + '/VLBLogos/GreenBox.png';
    imgGoldBox = images1 + '/VLBLogos/GoldBox.png';
    imgBox1 = images2 + '/VLBBoxPictures/Box1.png';
    imgMarvel = images2 + '/VLBBoxPictures/Marvel.png';
    imgDinosaur= images3 + '/VLBProductPictures/Dinosaur.png';
    imgKaiju = images3 + '/VLBProductPictures/Kaiju.png';
    imgScifi = images3 + '/VLBProductPictures/Scifi.png';
    imgHorror = images3 + '/VLBProductPictures/Horror.png';
    
    // Declared variables that hold confirmation messages.
    savedInfo ='';
    success = '';            
    confirmation = '';  // Holds the random confirmation number.
    confirmNum= '';
    message='';
    sendIssue = '';


    handleSignup(event){
        this.savedInfo= 'Success! Your shipping information is saved.';
    }

    // The method displays a signup confirmation message and a confirmation number when the button is clicked.
    handleConfirmation(event) {
        
        this.success= 'Success!';       
        this.confirmation = 'Confirmation Number: ';
        this.confirmNum = Math.floor(Math.random() * 1000) + 9000;
        this.message = 'Payment approved. You will receive an e-mail with all your Vintage Loot Box information. Enjoy!'; 
    }   

    handleIssue(event){
        this.sendIssue= 'Your subscriber issue has been sent to our VLB Customer Service Department and you will bne hearing from us soon.';   
    }
}