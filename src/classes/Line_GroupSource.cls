public class Line_GroupSource implements Line_Source{
    private final String type = 'group';
    private final String groupId;

    public Line_GroupSource(String groupId){
        this.groupId = groupId;
    }
    public String getType(){
        return type;
    }
    public String getGroupId(){
        return groupId;
    }
}