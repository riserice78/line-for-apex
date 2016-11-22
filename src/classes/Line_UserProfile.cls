public class Line_UserProfile{
    private final String displayName;
    private final String userId;
    private final String pictureUrl;
    private final String statusMessage;
    
    public Line_UserProfile(String displayName, String userId, String pictureUrl, String statusMessage){
        this.displayName = displayName;
        this.userId = userId;
        this.pictureUrl = pictureUrl;
        this.statusMessage = statusMessage;
    }    
    public String getDisplayName(){
        return displayName;
    }
    public String getUserId(){
        return userId;
    }
    public String getPictureUrl(){
        return pictureUrl;
    }
    public String getStatusMessage(){
        return statusMessage;
    }
}