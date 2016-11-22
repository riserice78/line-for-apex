public class Line_CarouselTemplate implements Line_Template{
    private final String type = 'carousel';
    /* Max: 5 */
    private final Line_Column[] columns;

    public Line_CarouselTemplate(Line_Column[] columns){
        this.columns = columns;
    }
    public String getType(){
        return type;
    }
    public Line_Column[] getColumns(){
        return columns;
    }
}