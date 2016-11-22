public class Line_PushMessage{
    /* Id of the receiver */
    private final String to;
    /* Max: 5 */
    private Line_Message[] messages;
    
    public Line_PushMessage(String to, Line_Message[] messages){
        this.to = to;
        this.messages = messages;
    }    
    public String getTo(){
        return to;
    }
    public Line_Message[] getMessages(){
        return messages;
    }
}