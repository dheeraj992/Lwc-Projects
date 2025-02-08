import { LightningElement,wire } from 'lwc';
import marriageInvitationAsset from '@salesforce/resourceUrl/marriageInvitationAsset';
import getDesiredInvitation from '@salesforce/apex/InvitationController.getDesiredInvitation';
import confetti from '@salesforce/resourceUrl/confetti'
import { loadScript } from 'lightning/platformResourceLoader';

// date :03/11/2024 : getting Cross Resource origin error at the moment looking for a fix (error subject : {"subject":"router level error")
// cause of error : in wire method was passing 'id' but was using 'Id' in apex method instead 
export default class InvitationBanner extends LightningElement {

    theme = 'theme1'
    recordId = 'a01J1000002qhm5IAA'
    facebookUrl
    instagramUrl
    greetingMessage
    EventIntroduction
    EventParticipants
    EventDateTime
    intervalId
    days
    hours
    minutes
    seconds
    timeDifference
    isScriptLoaded

    instagramImg = marriageInvitationAsset + '/instagram.svg'
    facebookImg = marriageInvitationAsset + '/facebook.svg'

    connectedCallback(){
        this.loadConfetti()
    
    }
    get bannerStyle(){
        console.log('get property triggered')
        let themeImage = marriageInvitationAsset + `/${this.theme}.jpeg`
        return `background-image: url(${themeImage})`
    }

    @wire(getDesiredInvitation,{Id:'$recordId'})
    desiredInvitation({error,data}){

        if(data){
            console.log('wire method triggered')
            console.log('results-->'+JSON.stringify(data))
            
            this.theme = data.Theme__c
            this.facebookUrl = data.Facebook_Url__c
            this.instagramUrl = data.Instagram_Url__c
            this.greetingMessage  = data.Greeting_Message__c
            this.EventIntroduction = data.Event_Introduction__c
            this.EventParticipants = data.Event_Participants__c
            this.EventDateTime = data.Event_Date_and_Time__c
            this.countDownTimer(this.EventDateTime)
            console.log('Event Date And Time-->'+this.EventDateTime)
        }

        if (error){
           
            throw new Error(error);
            console.log('error recieved-->'+error.body.message)
        }
    }

    countDownTimer(targetDatTime){

         this.intervalId = setInterval(()=>{

            let currentTime = new Date().getTime()
            let targetTime = new Date(targetDatTime).getTime()

            this.timeDifference = targetTime - currentTime
            this.days = Math.floor(this.timeDifference /(1000 * 60 * 60 * 24))
            this.hours = Math.floor(this.timeDifference %(1000 * 60 * 60 * 24) /(1000 * 60 * 60))
            this.minutes = Math.floor(this.timeDifference %(1000 * 60 * 60) /(1000 * 60))
            this.seconds = Math.floor(this.timeDifference %(1000 * 60) / 1000)
        },1000)

        if(this.timeDifference <=0){
            clearInterval(this.intervalId)
        }
    }

    loadConfetti(){

        if(this.isScriptLoaded){

            return
        }

        loadScript(this,confetti)
        .then(()=>{
            this.isScriptLoaded = true
            console.log('confetti loaded')
            const jsConfetti = new JSConfetti()
            jsConfetti.addConfetti()
        })
    }

}