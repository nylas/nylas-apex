public class DeleteEventResponse {
  public String request_id;

  public static DeleteEventResponse parse(String json) {
    return (DeleteEventResponse) System.JSON.deserialize(
      json,
      DeleteEventResponse.class
    );
  }
}
