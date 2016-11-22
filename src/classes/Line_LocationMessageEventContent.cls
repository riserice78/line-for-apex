public class Line_LocationMessageEventContent implements Line_MessageEventContent{
    private final String type = 'location';
    private final String id;
    private final String title;
    private final String address;
    private Decimal latitude;
    private Decimal longitude;

    public Line_LocationMessageEventContent(String id, String title, String address, Decimal latitude, Decimal longitude){
        this.id = id;
        this.title = title;
        this.address = address;
        this.latitude = latitude;
        this.longitude = longitude;
    }
    public String getId(){
        return id;
    }
    public String getType(){
        return type;
    }
    public String getTitle(){
        return title;
    }
    public String getAddress(){
        return address;
    }
    public Decimal getLatitude(){
        return latitude;
    }
    public Decimal getLongitude(){
        return longitude;
    }   
}