public class ReturnEventResponse {
  public String request_id;
  public Event data;

  public static ReturnEventResponse parse(String json) {
    return (ReturnEventResponse) System.JSON.deserialize(
      json,
      ReturnEventResponse.class
    );
  }
}
