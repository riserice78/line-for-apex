public class Line_AudioMessageEventContent implements Line_MessageEventContent{
    private final String type = 'audio';
    private final String id;

    public Line_AudioMessageEventContent(String id){
        this.id = id;
    }
    public String getId(){
        return id;
    }
    public String getType(){
        return type;
    }
}