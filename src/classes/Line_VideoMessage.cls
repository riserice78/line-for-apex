public class Line_VideoMessage implements Line_Message{
    private final String type = 'video';
    /* URL of video file (Max: 1000 characters). HTTPS. mp4. Less than 1 minute. Max: 10 MB */
    private final String originalContentUrl;
    /* URL of preview image (Max: 1000 characters). HTTPS. JPEG. Max: 240 x 240. Max: 1 MB */
    private final String previewImageUrl; 
        
    public Line_VideoMessage(String originalContentUrl, String previewImageUrl){
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