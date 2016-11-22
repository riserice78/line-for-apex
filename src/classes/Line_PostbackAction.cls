public class Line_PostbackAction implements Line_Action{
    private final String type = 'postback';
    /* Max: 20 characters */
    private final String label;
    /** Text sent when the action is performed. Max: 300 characters */
    private final String text;
    /**     String returned via webhook in the postback.data property of the postback event. Max: 300 characters **/
    private final String data;

    public Line_PostbackAction(String label, String text, String data){
        this.label = label;
        this.text = text;
        this.data = data;
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
    public String getData(){
        return data;
    }
}