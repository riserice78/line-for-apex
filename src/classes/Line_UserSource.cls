public class Line_UserSource implements Line_Source{
    private final String type = 'user';
    private final String userId;

    public Line_UserSource(String userId){
        this.userId = userId;
    }
    public String getType(){
        return type;
    }
    public String getUserId(){
        return userId;
    }
}