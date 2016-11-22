public class Line_AudioMessage implements Line_Message{
    private final String type = 'audio';
    /* URL of audio file (Max: 1000 characters). HTTPS. m4a. Less than 1 minute. Max 10 MB */
    private final String originalContentUrl;
    /* Length of audio file (milliseconds) */
    private final Integer duration; 
        
    public Line_AudioMessage(String originalContentUrl, Integer duration){
        this.originalContentUrl = originalContentUrl;
        this.duration = duration;
    }
    public String getType(){
        return type;
    }
    public String getOriginalContentUrl(){
        return originalContentUrl;
    }
    public Integer getDuration(){
        return duration;
    }
}