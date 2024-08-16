public class GetCurrentGrantResponse {
  public String request_id;
  public Grant data;

  public static GetCurrentGrantResponse parse(String json) {
    return (GetCurrentGrantResponse) System.JSON.deserialize(
      json,
      GetCurrentGrantResponse.class
    );
  }
}
