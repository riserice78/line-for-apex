public class Line_UriImageMapAction implements Line_ImageMapAction{
    private final String type = 'uri';
    /* Webpage URL. Max: 1000 characters */
    private final String linkUri;
    private Line_ImageMapArea area;    

    public Line_UriImageMapAction(String linkUri, Line_ImageMapArea area){
        this.linkUri = linkUri;
        this.area = area;
    }
    public String getType(){
        return type;
    }
    public String getLinkUri(){
        return linkUri;
    }
    public Line_ImageMapArea getImageMapArea(){
        return area;
    }
}