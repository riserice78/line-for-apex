public class Line_ImageMapArea{
    /** Horizontal position of the tappable area    */
    private final Integer x;
    /** Vertical position of the tappable area    */
    private final Integer y;
    /** Width of the tappable area    */
    private final Integer width;
    /** Height of the tappable area    */
    private final Integer height;

    public Line_ImageMapArea(Integer x, Integer y, Integer width, Integer height){
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
    }
        
    public Integer getX(){
        return x;
    }
    public Integer getY(){
        return y;
    }
    public Integer getWidth(){
        return width;
    }
    public Integer getHeight(){
        return height;
    }

}