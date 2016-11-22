public class Line_RoomSource implements Line_Source{
    private final String type = 'room';
    private final String roomId;

    public Line_RoomSource(String roomId){
        this.roomId = roomId;
    }
    public String getType(){
        return type;
    }
    public String getRoomId(){
        return roomId;
    }
}