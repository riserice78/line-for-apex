@RestResource(urlMapping='/restapi')
global class LineController {
    private static final String CHANNEL_ACCESS_TOKEN = '';

    public LineController(){
    }
    public String getAccessToken(){
        return CHANNEL_ACCESS_TOKEN;
    }
    public List<Contact> getLineContacts(){
        return [select id, lineId__c, name from Contact where lineId__c!=null];
    }
    
    
    private Line_Template createTemplate(){
        return null;
    }

    private static Contact createContact(String userId){
        String jsonStr = Line_Service.getUserProfile(userId, CHANNEL_ACCESS_TOKEN);
        Line_UserProfile user = Line_Builder.deserializeUserProfile(jsonStr);
        Contact contact = getContactByLineUserId(userId);
        if(contact==null){
            return new Contact(
                lastName = user.getDisplayName(), 
                description='json: '+jsonStr,
                lineId__c = userId,
                lineImageUrl__c = user.getPictureUrl(),
                lineDisplayName__c = user.getDisplayName(),
                lineIsFollowed__c = true
            );            
        }
        return null;
    }
    private static Contact setContactLineStatus(String userId, boolean status){
        Contact contact = getContactByLineUserId(userId);
        if(contact!=null){
            contact.lineIsFollowed__c = status;
            return contact;
        }
        return null;
    }


    @HttpPost
    global static String doPost(){
        List<Contact> contacts = new List<Contact>();
        String requestBody = RestContext.request.requestBody.toString();
        contacts.add( new Contact(lastName  = 'request: ', description=requestBody) );
        for(Line_Event event: Line_Builder.deserializeEvents(requestBody)){
            if(Line_Service.isEventFollow(event) && Line_Service.isSourceUser(event.getSource()) ){
                Line_UserSource source = (Line_UserSource)event.getSource();
                Contact newContact = createContact( source.getUserId() );
                if(newContact!=null){
                    contacts.add( newContact );
                }
            }else if(Line_Service.isEventUnfollow(event)){
              
            }else if ( Line_Service.isEventPostback(event) ){
                    contacts.add( new Contact(lastName  = 'postback ', description=requestBody) );
            }else{
                    contacts.add( new Contact(lastName  = 'else ', description=requestBody) );            
            }
        }

        if(contacts!=null && contacts.size()>0){
            upsert contacts;
        }
        return 'done ';
    }
       
    @HttpGet
    global static void doGet(){
        System.debug('GET*');
        RestContext.response.statusCode = 403;        
    }
    
    private static Contact getContactByLineUserId(String userId){
        List<Contact> contacts = [select id, lineIsFollowed__c from Contact where lineId__c=:userId];
        if(contacts!=null && contacts.size()>0){
            return contacts.get(0);
        }
        return null;
    }  

    @RemoteAction
    public static String pushTextMessageToLine(String accessToken, String userId, String text){
        List< Line_TextMessage > messages = new List< Line_TextMessage >();
        messages.add( new Line_TextMessage(text) );
        Line_PushMessage pushMessage = new Line_PushMessage(userId, messages);
        return Line_Service.pushMessage(pushMessage, accessToken);
    }
    @RemoteAction
    public static String pushImageMessageToLine(String accessToken, String userId, String originalContentUrl, String previewImageUrl){
        List< Line_ImageMessage > messages = new List< Line_ImageMessage >();
        messages.add( new Line_ImageMessage(originalContentUrl, previewImageUrl) );
        Line_PushMessage pushMessage = new Line_PushMessage(userId, messages);
        return Line_Service.pushMessage(pushMessage, accessToken);
    }
    @RemoteAction
    public static String pushVideoMessageToLine(String accessToken, String userId, String originalContentUrl, String previewImageUrl){
        List< Line_VideoMessage > messages = new List< Line_VideoMessage >();
        messages.add( new Line_VideoMessage(originalContentUrl, previewImageUrl) );
        Line_PushMessage pushMessage = new Line_PushMessage(userId, messages);
        return Line_Service.pushMessage(pushMessage, accessToken);
    }
    @RemoteAction
    public static String pushAudioMessageToLine(String accessToken, String userId, String originalContentUrl, Integer duration){
        List< Line_AudioMessage > messages = new List< Line_AudioMessage >();
        messages.add( new Line_AudioMessage(originalContentUrl, duration) );
        Line_PushMessage pushMessage = new Line_PushMessage(userId, messages);
        return Line_Service.pushMessage(pushMessage, accessToken);
    }
    @RemoteAction
    public static String pushLocationMessageToLine(String accessToken, String userId, String title, String address, Decimal latitude, Decimal longitude){
        List< Line_LocationMessage > messages = new List< Line_LocationMessage >();
        messages.add( new Line_LocationMessage(title, address, latitude, longitude) );
        Line_PushMessage pushMessage = new Line_PushMessage(userId, messages);
        return Line_Service.pushMessage(pushMessage, accessToken);
    }  
    @RemoteAction
    public static String pushStickerMessageToLine(String accessToken, String userId, String packageId, String stickerId){
        List< Line_StickerMessage > messages = new List< Line_StickerMessage >();
        messages.add( new Line_StickerMessage(packageId, stickerId) );
        Line_PushMessage pushMessage = new Line_PushMessage(userId, messages);
        return Line_Service.pushMessage(pushMessage, accessToken);
    }
    @RemoteAction
    public static String pushImageMapMessageToLine(String accessToken, String userId, String baseUrl, String altText, Line_ImagemapBaseSize baseSize, Line_UriImageMapAction[] uriActions, Line_MessageImageMapAction[] messageActions){
        List<Line_ImageMapAction> actions = new List<Line_ImageMapAction>();
        for(Line_UriImageMapAction action: uriActions){
            actions.add(action);
        }
        for(Line_MessageImageMapAction action: messageActions){
            actions.add(action);
        }
        List< Line_ImageMapMessage > messages = new List< Line_ImageMapMessage >();
        messages.add( new Line_ImageMapMessage(baseUrl, altText, baseSize, actions) );
        Line_PushMessage pushMessage = new Line_PushMessage(userId, messages);
        return Line_Service.pushMessage(pushMessage, accessToken);
    }
}
