//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class TokenExchangeResponse {
  public String access_token;
  public Integer expires_in;
  public String id_token;
  public String email;
  public String refresh_token;
  public String scope;
  public String token_type;
  public String grant_id;
  public String provider;

  public static TokenExchangeResponse parse(String json) {
    return (TokenExchangeResponse) System.JSON.deserialize(
      json,
      TokenExchangeResponse.class
    );
  }
}
