public class SendRSVPResponse {
  public String request_id;
  public Data data;

  public class Send_ics_error {
    public String type;
    public String message;
  }

  public class Data {
    public Send_ics_error send_ics_error;
  }

  public static SendRSVPResponse parse(String json) {
    return (SendRSVPResponse) System.JSON.deserialize(
      json,
      SendRSVPResponse.class
    );
  }
}
