public class Line_UriAction implements Line_Action{
    private final String type = 'uri';
    /* Max: 20 characters */
    private final String label;
    /** URI opened when the action is performed (Max: 1000 characters). http, https, tel */
    private final String uri;

    public Line_UriAction(String label, String uri){
        this.label = label;
        this.uri = uri;
    }
    public String getType(){
        return type;
    }
    public String getLabel(){
        return label;
    }
    public String getUri(){
        return uri;
    }
}