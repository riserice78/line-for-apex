public class Line_TextMessageEventContent implements Line_MessageEventContent{
    private final String type = 'text';
    private final String id;
    private final String text;
    public Line_TextMessageEventContent(String id, String text){
        this.id = id;
        this.text = text;
    }
    public String getId(){
        return id;
    }
    public String getType(){
        return type;
    }
    public String getText(){
        return text;
    }
}