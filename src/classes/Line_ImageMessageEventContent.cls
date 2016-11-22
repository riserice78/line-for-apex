public class Line_ImageMessageEventContent implements Line_MessageEventContent{
    private final String type = 'image';
    private final String id;

    public Line_ImageMessageEventContent(String id){
        this.id = id;
    }
    public String getId(){
        return id;
    }
    public String getType(){
        return type;
    }
}