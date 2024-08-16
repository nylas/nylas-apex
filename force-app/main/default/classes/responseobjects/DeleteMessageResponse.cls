public class DeleteMessageResponse {
  public String request_id;

  public static DeleteMessageResponse parse(String json) {
    return (DeleteMessageResponse) System.JSON.deserialize(
      json,
      DeleteMessageResponse.class
    );
  }
}
