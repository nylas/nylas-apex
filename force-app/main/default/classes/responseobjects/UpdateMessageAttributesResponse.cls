public class UpdateMessageAttributesResponse {
  public String request_id;
  public Message data;

  public static UpdateMessageAttributesResponse parse(String json) {
    return (UpdateMessageAttributesResponse) System.JSON.deserialize(
      json,
      UpdateMessageAttributesResponse.class
    );
  }
}
