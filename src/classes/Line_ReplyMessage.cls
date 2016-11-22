public class Line_ReplyMessage{
    /* replyToken received via webhook */
    private final String replyToken;
    /* Max: 5 */
    private Line_Message[] messages;
    
    public Line_ReplyMessage(String replyToken, Line_Message[] messages){
        this.replyToken = replyToken;
        this.messages = messages;
    }    
    public String getReplyToken(){
        return replyToken;
    }
    public Line_Message[] getMessages(){
        return messages;
    }
}