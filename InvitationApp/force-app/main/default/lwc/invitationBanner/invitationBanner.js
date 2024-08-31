import { LightningElement } from 'lwc';
import marriageInvitationAsset from '@salesforce/resourceUrl/marriageInvitationAsset';


export default class InvitationBanner extends LightningElement {

    theme = 'theme1'

    instagramImg = marriageInvitationAsset + '/instagram.svg'
    facebookImg = marriageInvitationAsset + '/facebook.svg'

    get bannerStyle(){

        let themeImage = marriageInvitationAsset + `/${this.theme}.jpeg`
        return `background-image: url(${themeImage})`
    }
}