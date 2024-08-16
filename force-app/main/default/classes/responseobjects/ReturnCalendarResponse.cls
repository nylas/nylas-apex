public class ReturnCalendarResponse {
  public String request_id;
  public Calendar data;

  public static ReturnCalendarResponse parse(String json) {
    return (ReturnCalendarResponse) System.JSON.deserialize(
      json,
      ReturnCalendarResponse.class
    );
  }
}
