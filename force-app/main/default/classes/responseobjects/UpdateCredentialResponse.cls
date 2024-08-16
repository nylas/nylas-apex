public class UpdateCredentialResponse {
  public String request_id;
  public ConnectorCredential data;

  public static UpdateCredentialResponse parse(String json) {
    return (UpdateCredentialResponse) System.JSON.deserialize(
      json,
      UpdateCredentialResponse.class
    );
  }
}
