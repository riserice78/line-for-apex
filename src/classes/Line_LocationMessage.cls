public class Line_LocationMessage implements Line_Message{
    private final String type = 'location';
    /* Max: 100 characters */
    private final String title;
    /* Max: 100 characters */
    private final String address;
    private Decimal latitude;
    private Decimal longitude;
        
    public Line_LocationMessage(String title, String address, Decimal latitude, Decimal longitude){
        this.title = title;
        this.address = address;
        this.latitude = latitude;
        this.longitude = longitude;
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