public class Line_TemplateMessage implements Line_Message{
    private final String type = 'template';
    /* Max: 400 characters */
    private final String altText;    
    /* Buttons, Confirm, Carousel */
    private Line_Template template;
        
    public Line_TemplateMessage(String altText, Line_Template template){
        this.altText = altText;
        this.template = template;
    }
    public String getType(){
        return type;
    }
    public String getAltText(){
        return altText;
    }    
    public Line_Template getTemplate(){
        return template;
    }

}