public class Line_ConfirmTemplate implements Line_Template{
    private final String type = 'confirm';
    /* Max: 240 characters */
    private final String text;
    /* Max: 2 */
    private final Line_Action[] actions;

    public Line_ConfirmTemplate(String text, Line_Action[] actions){
        this.text = text;
        this.actions = actions;
    }
    public String getType(){
        return type;
    }
    public String getText(){
        return text;
    }
    public Line_Action[] getActions(){
        return actions;
    }
}