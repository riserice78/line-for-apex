public class Line_LeaveEvent implements Line_Event{
    private final String type = 'leave';
    private final Datetime timestamp;
    private final Line_Source source;
    public Line_LeaveEvent(Datetime timestamp, Line_Source source){
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