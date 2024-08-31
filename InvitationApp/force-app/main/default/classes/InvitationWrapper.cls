public class InvitationWrapper{

	public String Contact_Number;
	public String Event_Address;
	public Datetime Event_Date_and_Time;
	public String Event_Introduction;
	public String Event_Map_URL;
	public String Event_Name;
	public String Event_Participants;
	public String Facebook_Url;
	public String Greeting_Message;
	public String Instagram_Url;
	public String Rsvp_Accept_Message;
	public String Rsvp_after_date_Message;
	public String Rsvp_Decline_Message;
	public String Theme;
	public String Twitter_Url;

	
	public static InvitationWrapper parse(String json) {
		return (InvitationWrapper) System.JSON.deserialize(json, InvitationWrapper.class);
	}
}