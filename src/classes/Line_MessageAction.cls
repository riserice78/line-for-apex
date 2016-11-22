public class Line_MessageAction implements Line_Action{
    private final String type = 'message';
    /* Max: 20 characters */
    private final String label;
    /** Text sent when the action is performed. Max: 300 characters */
    private final String text;

    public Line_MessageAction(String label, String text){
        this.label = label;
        this.text = text;
    }
    public String getType(){
        return type;
    }
    public String getLabel(){
        return label;
    }
    public String getText(){
        return text;
    }
}