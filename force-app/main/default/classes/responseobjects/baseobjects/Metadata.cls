public class Metadata {
  public Map<String, Object> data { get; set; }

  public Metadata(JSONParser parser) {
    data = new Map<String, Object>();
    while (parser.nextToken() != System.JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
        String key = parser.getText();
        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
          Object value;
          switch on parser.getCurrentToken() {
            when VALUE_STRING {
              value = parser.getText();
            }
            when VALUE_NUMBER_INT {
              value = parser.getLongValue();
            }
            when VALUE_NUMBER_FLOAT {
              value = parser.getDoubleValue();
            }
            when VALUE_TRUE, VALUE_FALSE {
              value = parser.getBooleanValue();
            }
            when START_OBJECT {
              value = parser.readValueAs(Map<String, Object>.class);
            }
            when START_ARRAY {
              value = parser.readValueAs(List<Object>.class);
            }
            when else {
              value = null;
            }
          }
          data.put(key, value);
        }
      }
    }
  }
}
