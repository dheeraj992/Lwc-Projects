public with sharing class CreateSampleRecords {
   

    @InvocableMethod(label = 'Create Invitation Records' description = 'Method to Create Sample Invitation Records')
    public static void createInvitations(){
        String jsonString = '{' +
    '"Contact_Number": "+11 111 1111",' +
    '"Event_Address": "Sheraton Melbourne Hotel, 27 Little Collins St, Melbourne VIC 3000",' +
    '"Event_Date_and_Time": "2024-03-01T02:00:00.000+0000",' +
    '"Event_Introduction": "The wedding celebration of",' +
    '"Event_Map_URL": "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3152.033181249852!2d144.97004547588523!3d-37.812691771975864!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad642c6247961ad%3A0xb0481355c7a6d61!2sSheraton%20Melbourne%20Hotel!5e0!3m2!1sen!2sau!4v",' +
    '"Event_Name": "Michelle and Andrew Wedding",' +
    '"Event_Participants": "Michelle and Andrew",' +
    '"Facebook_Url": "https://www.facebook.com/",' +
    '"Greeting_Message": "WE ARE GLAD TO INVITE YOU TO",' +
    '"Instagram_Url": "https://www.instagram.com/",' +
    '"Rsvp_Accept_Message": "Your RSVP has been successfully submitted. Looking forward to having you there!",' +
    '"Rsvp_after_date_Message": "Thanks for trying to RSVP! Unfortunately, the response date has passed. If you still plan to attend, kindly contact us for assistance.",' +
    '"Rsvp_Decline_Message": "Thank you for your response. While we\'re sad you won\'t be there, we understand. Feel free to reach out if anything changes.",' +
    '"Theme": "theme1",' +
    '"Twitter_Url": "https://twitter.com/"' +
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


    }
}