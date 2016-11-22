public class Line_FollowEvent implements Line_Event{
    private final String type = 'follow';
    private final String replyToken;
    private final Datetime timestamp;
    private final Line_Source source;

    public Line_FollowEvent(String replyToken, Datetime timestamp, Line_Source source){
        this.replyToken = replyToken;
        this.timestamp = timestamp;
        this.source = source;
    }
    public String getType(){
        return type;
    }
    public String getReplyToken(){
        return replyToken;
    }
    public Datetime getTimestamp(){
        return timestamp;
    }
    public Line_Source getSource(){
        return source;
    }
}