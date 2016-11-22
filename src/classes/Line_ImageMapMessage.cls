public class Line_ImageMapMessage implements Line_Message{
    private final String type = 'imagemap';
    /* Base URL of image (Max: 1000 characters). HTTPS  */
    private final String baseUrl;
    /* Max: 400 characters */
    private final String altText;    
    /* Max: 50 */    
    private final Line_ImageMapAction[] actions;
    /* Width of base image (set to 1040px） */
    /*Height of base image（set to the height that corresponds to a width of 1040px） */
    private Line_ImagemapBaseSize baseSize;
        
    public Line_ImageMapMessage(String baseUrl, String altText, Line_ImagemapBaseSize baseSize, Line_ImageMapAction[] actions){
        this.baseUrl = baseUrl;
        this.altText = altText;
        this.baseSize = baseSize;
        this.actions = actions;
    }
    public String getType(){
        return type;
    }
    public String getBaseUrl(){
        return baseUrl;
    }
    public Line_ImageMapAction[] getActions(){
        return actions;
    }
    public String getAltText(){
        return altText;
    }    
    public Line_ImagemapBaseSize getBaseSize(){
        return baseSize;
    }

}