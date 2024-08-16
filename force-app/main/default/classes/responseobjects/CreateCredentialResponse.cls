public class CreateCredentialResponse {
  public String request_id;
  public ConnectorCredential data;

  public static CreateCredentialResponse parse(String json) {
    return (CreateCredentialResponse) System.JSON.deserialize(
      json,
      CreateCredentialResponse.class
    );
  }
}
