public class DeleteCredentialResponse {
  public String request_id;

  public static DeleteCredentialResponse parse(String json) {
    return (DeleteCredentialResponse) System.JSON.deserialize(
      json,
      DeleteCredentialResponse.class
    );
  }
}
