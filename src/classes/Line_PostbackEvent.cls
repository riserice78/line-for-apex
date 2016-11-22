public class Line_PostbackEvent implements Line_Event{
    private final String type = 'postback';
    private final String replyToken;
    private final Line_PostbackContent postback;
    private final Datetime timestamp;
    private final Line_Source source;
    
    public Line_PostbackEvent(String replyToken, Line_PostbackContent postback, Datetime timestamp, Line_Source source){
        this.replyToken = replyToken;
        this.postback = postback;
        this.timestamp = timestamp;
        this.source = source;
    }
    public String getType(){
        return type;
    }
    public String getReplyToken(){
        return replyToken;
    }
    public Line_PostbackContent getPostback(){
        return postback;
    }
    public Datetime getTimestamp(){
        return timestamp;
    }
    public Line_Source getSource(){
        return source;
    }
}