public class CreateEventResponse {
  public String request_id;
  public Event data;

  public static CreateEventResponse parse(String json) {
    return (CreateEventResponse) System.JSON.deserialize(
      json,
      CreateEventResponse.class
    );
  }
}
