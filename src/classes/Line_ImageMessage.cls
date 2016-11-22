public class Line_ImageMessage implements Line_Message{
    private final String type = 'image';
    /* Image URL (Max: 1000 characters). HTTPS. JPEG. Max: 1024 x 1024. Max: 1 MB */
    private final String originalContentUrl;
    /* Preview Image URL (Max: 1000 characters). HTTPS. JPEG. Max: 240 x 240. Max: 1 MB */
    private final String previewImageUrl; 
    
    public Line_ImageMessage(String originalContentUrl, String previewImageUrl){
        this.originalContentUrl = originalContentUrl;
        this.previewImageUrl = previewImageUrl;
    }
    public String getType(){
        return type;
    }
    public String getOriginalContentUrl(){
        return originalContentUrl;
    }
    public String getPreviewImageUrl(){
        return previewImageUrl;
    }
}