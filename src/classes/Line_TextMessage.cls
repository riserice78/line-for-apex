public class Line_TextMessage implements Line_Message{
    private final String type = 'text';
    /* Max: 2000 characters */
    private final String text;
    
    public Line_TextMessage(String text){
        this.text = text;
    }
    public String getType(){
        return type;
    }
    public String getText(){
        return text;
    }
}