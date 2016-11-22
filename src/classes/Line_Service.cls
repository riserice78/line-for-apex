public class Line_Service{
    private static final String LINE_PUSH_MESSAGE_ENDPOINT = 'https://api.line.me/v2/bot/message/push';
    private static final String LINE_GET_PROFILE_ENDPOINT = 'https://api.line.me/v2/bot/profile/';    
    private static final String EVENT_TYPE_FOLLOW = 'follow';
    private static final String EVENT_TYPE_UNFOLLOW = 'unfollow';
    private static final String EVENT_TYPE_JOIN = 'join';
    private static final String EVENT_TYPE_LEAVE = 'leave';
    private static final String EVENT_TYPE_POSTBACK = 'postback';
    private static final String SOURCE_TYPE_USER = 'user';

    public static boolean isSourceUser(Line_Source source){
        return source.getType().equals(SOURCE_TYPE_USER);
    }
    public static boolean isEventFollow(Line_Event event){
        return event.getType().equals(EVENT_TYPE_FOLLOW);
    }
    public static boolean isEventUnfollow(Line_Event event){
        return event.getType().equals(EVENT_TYPE_UNFOLLOW);    
    }
    public static boolean isEventPostback(Line_Event event){
        return event.getType().equals(EVENT_TYPE_POSTBACK);
    }
    public static boolean isEventJoin(Line_Event event){
        return event.getType().equals(EVENT_TYPE_JOIN);
    }
    public static boolean isEventLeave(Line_Event event){
        return event.getType().equals(EVENT_TYPE_LEAVE);
    }    

    public static String getUserProfile(String userId, String accessToken){
        HttpRequest req = new HttpRequest();
        req.setEndpoint(LINE_GET_PROFILE_ENDPOINT+userId);
        req.setMethod('GET');
        req.setHeader('Authorization', 'Bearer ' +accessToken);
        Http http = new Http();
        HTTPResponse res = http.send(req);
        return res.getBody();
    }

    public static String pushMessage(Line_PushMessage pushMessage, String accessToken){
        String json = Line_Builder.buildPushMessageJson(pushMessage);
        HttpRequest req = new HttpRequest();
        req.setEndpoint(LINE_PUSH_MESSAGE_ENDPOINT);
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Authorization', 'Bearer ' +accessToken);
        req.setBody( json );
        Http http = new Http();
        HTTPResponse res = http.send(req);
        return res.getBody();    
    }
}