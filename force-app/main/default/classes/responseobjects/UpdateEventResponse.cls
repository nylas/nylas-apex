public class UpdateEventResponse {
  public String request_id;
  public Event data;

  public static UpdateEventResponse parse(String json) {
    return (UpdateEventResponse) System.JSON.deserialize(
      json,
      UpdateEventResponse.class
    );
  }
}
