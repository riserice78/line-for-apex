public class Line_MessageEvent implements Line_Event{
    private final String type = 'message';
    private final String replyToken;
    private final Datetime timestamp;
    private final Line_Source source;
    private final Line_MessageEventContent message;

    public Line_MessageEvent(String replyToken, Datetime timestamp, Line_Source source, Line_MessageEventContent message){
        this.replyToken = replyToken;
        this.timestamp = timestamp;
        this.source = source;
        this.message = message;
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
    public Line_MessageEventContent getMessage(){
        return message;
    }
}