public with sharing class CreateSampleRecords {
   


    public static void createInvitations(){
        List<Id> randomIds = new List<Id>();
        String jsonString = '{' +
    '"Contact_Number__c": "+11 111 1111",' +
    '"Event_Address__c": "Sheraton Melbourne Hotel, 27 Little Collins St, Melbourne VIC 3000",' +
    '"Event_Date_and_Time__c": "2024-03-01T02:00:00.000+0000",' +
    '"Event_Introduction__c": "The wedding celebration of",' +
    '"Event_Map_URL__c": "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3152.033181249852!2d144.97004547588523!3d-37.812691771975864!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642c6247961ad%3A0xb0481355c7a6d61!2sSheraton%20Melbourne%20Hotel!5e0!3m2!1sen!2sau!4v",' +
    '"Event_Name__c": "Michelle and Andrew Wedding",' +
    '"Event_Participants__c": "Michelle and Andrew",' +
    '"Facebook_Url__c": "https://www.facebook.com/",' +
    '"Greeting_Message__c": "WE ARE GLAD TO INVITE YOU TO",' +
    '"Instagram_Url__c": "https://www.instagram.com/",' +
    '"Rsvp_Accept_Message__c": "Your RSVP has been successfully submitted. Looking forward to having you there!",' +
    '"Rsvp_after_date_Message__c": "Thanks for trying to RSVP! Unfortunately, the response date has passed. If you still plan to attend, kindly contact us for assistance.",' +
    '"Rsvp_Decline_Message__c": "Thank you for your response. While we\'re sad you won\'t be there, we understand. Feel free to reach out if anything changes.",' +
    '"Theme__c": "theme1",' +
    '"Twitter_Url__c": "https://twitter.com/"' +
    '}';

        InvitationWrapper data = InvitationWrapper.parse(jsonString);

        List<Invitation__c> invitationRecords = new List<Invitation__c>();

        for(Integer i = 0; i<5;i++){

            Invitation__c inv = new Invitation__c();
            inv.Contact_Number__c = data.Contact_Number;
            inv.Event_Address__c = data.Event_Address;
            inv.Event_Date_and_Time__c = data.Event_Date_and_Time;
            inv.Event_Introduction__c = data.Event_Introduction;
            inv.Event_Map_URL__c = data.Event_Map_URL;
            inv.Event_Name__c = data.Event_Name;
            inv.Event_Participants__c = data.Event_Participants;
            inv.Facebook_Url__c = data.Facebook_Url;
            inv.Greeting_Message__c = data.Greeting_Message;
            inv.Instagram_Url__c = data.Instagram_Url;
            inv.Rsvp_Accept_Message__c = data.Rsvp_Accept_Message;
            inv.Rsvp_after_date_Message__c = data.Rsvp_after_date_Message;
            inv.Rsvp_Decline_Message__c = data.Rsvp_Decline_Message;
            inv.Theme__c = data.Theme;

            invitationRecords.add(inv);

        }

        if(invitationRecords.size()>0){

            insert invitationRecords;
        }

        else{

            System.debug('No invitation records to create');
        }

        return randomIds;

    }
}