public class DeleteGrantResponse {
  public String request_id;

  public static DeleteGrantResponse parse(String json) {
    return (DeleteGrantResponse) System.JSON.deserialize(
      json,
      DeleteGrantResponse.class
    );
  }
}
