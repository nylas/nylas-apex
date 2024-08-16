public class UpdateCalendarResponse {
  public String request_id;
  public Calendar data;

  public static UpdateCalendarResponse parse(String json) {
    return (UpdateCalendarResponse) System.JSON.deserialize(
      json,
      UpdateCalendarResponse.class
    );
  }
}
