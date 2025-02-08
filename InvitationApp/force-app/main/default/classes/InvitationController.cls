public without sharing class InvitationController {

@auraEnabled(cacheable = true)    
public static Invitation__c getDesiredInvitation(String Id){

    if (Id == null) {
        throw new AuraHandledException('id hi null aaarhi hai bc');
    }

    try{

        return [Select Id,Theme__c,Instagram_Url__c,Event_Date_and_Time__c,	Event_Introduction__c,Facebook_Url__c,

            Event_Participants__c,Greeting_Message__c from Invitation__c Where Id = :id];
    }

    catch(Exception e){

         throw new AuraHandledException('type of error-->'+e.getMessage());
    }

}

@auraEnabled(cacheable = true)    
public static List<Program_Detail__c> getProgramDetailsByInvitationId(String id){


    try{

        return [Select Id,Name,Program_Date__c,Program_Start_Time__c,Program_End_Time__c 
        from Program_Detail__c Where Invitation__c = :id];
    }

    catch(Exception e){

         throw new AuraHandledException(e.getMessage());
    }

}

}