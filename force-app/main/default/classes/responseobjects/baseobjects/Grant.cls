public class Grant {
  public String id { get; set; }
  public String provider { get; set; }
  public String account_id { get; set; }
  public String grant_status { get; set; }
  public String email { get; set; }
  public List<String> scope { get; set; }
  public String user_agent { get; set; }
  public String ip { get; set; }
  public String state { get; set; }
  public Integer created_at { get; set; }
  public Integer updated_at { get; set; }

  public Grant(JSONParser parser) {
    while (parser.nextToken() != System.JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
          if (text == 'id') {
            id = parser.getText();
          } else if (text == 'provider') {
            provider = parser.getText();
          } else if (text == 'account_id') {
            account_id = parser.getText();
          } else if (text == 'grant_status') {
            grant_status = parser.getText();
          } else if (text == 'email') {
            email = parser.getText();
          } else if (text == 'scope') {
            scope = arrayOfString(parser);
          } else if (text == 'user_agent') {
            user_agent = parser.getText();
          } else if (text == 'ip') {
            ip = parser.getText();
          } else if (text == 'state') {
            state = parser.getText();
          } else if (text == 'created_at') {
            created_at = parser.getIntegerValue();
          } else if (text == 'updated_at') {
            updated_at = parser.getIntegerValue();
          } else {
            System.debug(
              LoggingLevel.WARN,
              'Grant consuming unrecognized property: ' + text
            );
            consumeObject(parser);
          }
        }
      }
    }
  }

  public static void consumeObject(System.JSONParser parser) {
    Integer depth = 0;
    do {
      System.JSONToken curr = parser.getCurrentToken();
      if (
        curr == System.JSONToken.START_OBJECT ||
        curr == System.JSONToken.START_ARRAY
      ) {
        depth++;
      } else if (
        curr == System.JSONToken.END_OBJECT ||
        curr == System.JSONToken.END_ARRAY
      ) {
        depth--;
      }
    } while (depth > 0 && parser.nextToken() != null);
  }

  private static List<String> arrayOfString(System.JSONParser p) {
    List<String> res = new List<String>();
    if (p.getCurrentToken() == null)
      p.nextToken();
    while (p.nextToken() != System.JSONToken.END_ARRAY) {
      res.add(p.getText());
    }
    return res;
  }
}
