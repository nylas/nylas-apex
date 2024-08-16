public class DeleteCalendarResponse {
  public String request_id;

  public static DeleteCalendarResponse parse(String json) {
    return (DeleteCalendarResponse) System.JSON.deserialize(
      json,
      DeleteCalendarResponse.class
    );
  }
}
