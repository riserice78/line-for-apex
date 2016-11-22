public class Line_StickerMessage implements Line_Message{
    private final String type = 'sticker';
    private final String packageId;
    private final String stickerId;
        
    public Line_StickerMessage(String packageId, String stickerId){
        this.packageId = packageId;
        this.stickerId = stickerId;
    }
    public String getType(){
        return type;
    }
    public String getPackageId(){
        return packageId;
    }
    public String getStickerId(){
        return stickerId;
    }
}