public class Line_VideoMessageEventContent implements Line_MessageEventContent{
    private final String type = 'video';
    private final String id;

    public Line_VideoMessageEventContent(String id){
        this.id = id;
    }
    public String getId(){
        return id;
    }
    public String getType(){
        return type;
    }
}