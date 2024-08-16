public class SendRSVPResponse {
  public String request_id;

  public static SendRSVPResponse parse(String json) {
    return (SendRSVPResponse) System.JSON.deserialize(
      json,
      SendRSVPResponse.class
    );
  }
}
