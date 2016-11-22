public class Line_MessageImageMapAction implements Line_ImageMapAction{
    private final String type = 'message';
    /* Max: 400 characters */
    private final String text;
    private Line_ImageMapArea area;    

    public Line_MessageImageMapAction(String text, Line_ImageMapArea area){
        this.text = text;
        this.area = area;
    }
    public String getType(){
        return type;
    }
    public String getText(){
        return text;
    }
    public Line_ImageMapArea getImageMapArea(){
        return area;
    }
}