public class ReturnMessageResponse {
  public String request_id;
  public Message data;

  public static ReturnMessageResponse parse(String json) {
    return (ReturnMessageResponse) System.JSON.deserialize(
      json,
      ReturnMessageResponse.class
    );
  }
}
