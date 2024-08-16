public class ConnectorCredential {
  public String id { get; set; }
  public String name { get; set; }
  public String credential_type { get; set; }
  public Integer created_at { get; set; }
  public Integer updated_at { get; set; }

  public ConnectorCredential(JSONParser parser) {
    while (parser.nextToken() != System.JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
          if (text == 'id') {
            id = parser.getText();
          } else if (text == 'name') {
            name = parser.getText();
          } else if (text == 'credential_type') {
            credential_type = parser.getText();
          } else if (text == 'created_at') {
            created_at = parser.getIntegerValue();
          } else if (text == 'updated_at') {
            updated_at = parser.getIntegerValue();
          } else {
            System.debug(
              LoggingLevel.WARN,
              'ConnectorCredential consuming unrecognized property: ' + text
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
}
