public class Calendar {
  public String description { get; set; }
  public String hex_color { get; set; }
  public String hex_foreground_color { get; set; }
  public String id { get; set; }
  public Boolean is_owned_by_user { get; set; }
  public Boolean is_primary { get; set; }
  public String location { get; set; }
  public Metadata metadata { get; set; }
  public String name { get; set; }
  public String object_Z { get; set; } // in json: object
  public Boolean read_only { get; set; }
  public String timezone { get; set; }

  public Calendar(JSONParser parser) {
    while (parser.nextToken() != System.JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
          if (text == 'description') {
            description = parser.getText();
          } else if (text == 'hex_color') {
            hex_color = parser.getText();
          } else if (text == 'hex_foreground_color') {
            hex_foreground_color = parser.getText();
          } else if (text == 'id') {
            id = parser.getText();
          } else if (text == 'is_owned_by_user') {
            is_owned_by_user = parser.getBooleanValue();
          } else if (text == 'is_primary') {
            is_primary = parser.getBooleanValue();
          } else if (text == 'location') {
            location = parser.getText();
          } else if (text == 'metadata') {
            metadata = new Metadata(parser);
          } else if (text == 'name') {
            name = parser.getText();
          } else if (text == 'object') {
            object_Z = parser.getText();
          } else if (text == 'read_only') {
            read_only = parser.getBooleanValue();
          } else if (text == 'timezone') {
            timezone = parser.getText();
          } else {
            System.debug(
              LoggingLevel.WARN,
              'Calendar consuming unrecognized property: ' + text
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
