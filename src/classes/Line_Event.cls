public interface Line_Event{
    String getType();
    Datetime getTimestamp();
    Line_Source getSource();
}