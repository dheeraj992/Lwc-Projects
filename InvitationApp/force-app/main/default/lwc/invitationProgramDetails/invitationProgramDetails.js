import { LightningElement,wire } from 'lwc';
import programDetails from '@salesforce/apex/InvitationController.getProgramDetailsByInvitationId';

export default class InvitationProgramDetails extends LightningElement {


    recordId = ''
    programDetails = []
    @wire(programDetails,{id:'$recordId'})
    programDetails({data,error}){

        if(data){
            this.programDetails = data

        }

        else {

            
        }
    }
    
}