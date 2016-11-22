public class Line_UnfollowEvent implements Line_Event{
    private final String type = 'unfollow';
    private final Datetime timestamp;
    private final Line_Source source;
        
    public Line_UnfollowEvent(Datetime timestamp, Line_Source source){
        this.timestamp = timestamp;
        this.source = source;
    }
    public String getType(){
        return type;
    }
    public Datetime getTimestamp(){
        return timestamp;
    }
    public Line_Source getSource(){
        return source;
    }
}