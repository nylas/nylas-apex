public class CreateCalendarResponse {
  public String request_id;
  public Calendar data;

  public static CreateCalendarResponse parse(String json) {
    return (CreateCalendarResponse) System.JSON.deserialize(
      json,
      CreateCalendarResponse.class
    );
  }
}
