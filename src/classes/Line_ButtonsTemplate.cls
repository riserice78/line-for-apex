public class Line_ButtonsTemplate implements Line_Template{
    private final String type = 'buttons';
    /*Optional. Image URL (Max: 1000 characters). HTTPS. JPEG or PNG. Aspect ratio: 1:1.51. Max width: 1024px. Max: 1 MB */
    private final String thumbnailImageUrl;
    /*Optional.  max: 40 characters */
    private final String title;
    /* Max: 160 characters (no image or title). Max: 60 characters (message with an image or title)     */
    private final String text;
    /* Max: 4 */
    private final Line_Action[] actions; 

    public Line_ButtonsTemplate(String text, Line_Action[] actions){
        this.text = text;
        this.actions = actions;
    }
    public Line_ButtonsTemplate(String title, String text, Line_Action[] actions){
        this.title = title;
        this.text = text;
        this.actions = actions;
    }
    public Line_ButtonsTemplate(String thumbnailImageUrl, String title, String text, Line_Action[] actions){
        this.thumbnailImageUrl = thumbnailImageUrl;
        this.title = title;
        this.text = text;
        this.actions = actions;
    }
    public String getType(){
        return type;
    }
    public String getThumbnailImageUrl(){
        return thumbnailImageUrl;
    }
    public String getTitle(){
        return title;
    }
    public String getText(){
        return text;
    }
    public Line_Action[] getActions(){
        return actions;
    }
}