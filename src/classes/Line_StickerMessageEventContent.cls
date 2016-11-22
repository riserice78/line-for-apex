public class Line_StickerMessageEventContent implements Line_MessageEventContent{
    private final String type = 'sticker';
    private final String id;
    private final String packageId;
    private final String stickerId;

    public Line_StickerMessageEventContent(String id, String packageId, String stickerId){
        this.id = id;
        this.packageId = packageId;
        this.stickerId = stickerId;
    }
    public String getId(){
        return id;
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