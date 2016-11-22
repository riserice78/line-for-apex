public class Line_Column{
    /* Optional. Image URL (Max: 1000 characters). HTTPS. JPEG or PNG. Aspect ratio: 1:1.51. Max width: 1024px. Max: 1 MB */
    private final String thumbnailImageUrl;
    /* Optional. Max: 40 characters */
    private final String title;
    /* Max: 120 characters (no image or title). Max: 60 characters (message with an image or title) */
    private final String text;
    /* Action when tapped. Max: 3 */
    private Line_Action[] actions;

    public Line_Column(String text, Line_Action[] actions){
        this.text = text;
        this.actions = actions;    
    }
    public Line_Column(String thumbnailImageUrl, String title, String text, Line_Action[] actions){
        this.title = title;
        this.thumbnailImageUrl = thumbnailImageUrl;
        this.text = text;
        this.actions = actions;    
    }
    public Line_Column(String title, String text, Line_Action[] actions){
        this.title = title;
        this.text = text;
        this.actions = actions;    
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