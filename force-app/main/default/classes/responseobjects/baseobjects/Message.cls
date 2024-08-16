public class Message {
  public class Cc {
    public String name { get; set; }
    public String email { get; set; }

    public Cc(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'name') {
              name = parser.getText();
            } else if (text == 'email') {
              email = parser.getText();
            } else {
              System.debug(
                LoggingLevel.WARN,
                'Cc consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Attachments {
    public String content_type { get; set; }
    public String id { get; set; }
    public Integer size { get; set; }
    public String filename { get; set; }

    public Attachments(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'content_type') {
              content_type = parser.getText();
            } else if (text == 'id') {
              id = parser.getText();
            } else if (text == 'size') {
              size = parser.getIntegerValue();
            } else if (text == 'filename') {
              filename = parser.getText();
            } else {
              System.debug(
                LoggingLevel.WARN,
                'Attachments consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public String body { get; set; }
  public List<Cc> cc { get; set; }
  public Integer date_Z { get; set; } // in json: date
  public List<Attachments> attachments { get; set; }
  public List<String> folders { get; set; }
  public List<Cc> from_Z { get; set; } // in json: from
  public String grant_id { get; set; }
  public String id { get; set; }
  public String object_Z { get; set; } // in json: object
  public List<Cc> reply_to { get; set; }
  public String snippet { get; set; }
  public Boolean starred { get; set; }
  public String subject { get; set; }
  public String thread_id { get; set; }
  public List<Cc> to { get; set; }
  public Boolean unread { get; set; }

  public Message(JSONParser parser) {
    while (parser.nextToken() != System.JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
          if (text == 'body') {
            body = parser.getText();
          } else if (text == 'cc') {
            cc = arrayOfCc(parser);
          } else if (text == 'date') {
            date_Z = parser.getIntegerValue();
          } else if (text == 'attachments') {
            attachments = arrayOfAttachments(parser);
          } else if (text == 'folders') {
            folders = arrayOfString(parser);
          } else if (text == 'from') {
            from_Z = arrayOfCc(parser);
          } else if (text == 'grant_id') {
            grant_id = parser.getText();
          } else if (text == 'id') {
            id = parser.getText();
          } else if (text == 'object') {
            object_Z = parser.getText();
          } else if (text == 'reply_to') {
            reply_to = arrayOfCc(parser);
          } else if (text == 'snippet') {
            snippet = parser.getText();
          } else if (text == 'starred') {
            starred = parser.getBooleanValue();
          } else if (text == 'subject') {
            subject = parser.getText();
          } else if (text == 'thread_id') {
            thread_id = parser.getText();
          } else if (text == 'to') {
            to = arrayOfCc(parser);
          } else if (text == 'unread') {
            unread = parser.getBooleanValue();
          } else {
            System.debug(
              LoggingLevel.WARN,
              'Message consuming unrecognized property: ' + text
            );
            consumeObject(parser);
          }
        }
      }
    }
  }

  private static List<Attachments> arrayOfAttachments(System.JSONParser p) {
    List<Attachments> res = new List<Attachments>();
    if (p.getCurrentToken() == null)
      p.nextToken();
    while (p.nextToken() != System.JSONToken.END_ARRAY) {
      res.add(new Attachments(p));
    }
    return res;
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

  private static List<Cc> arrayOfCc(System.JSONParser p) {
    List<Cc> res = new List<Cc>();
    if (p.getCurrentToken() == null)
      p.nextToken();
    while (p.nextToken() != System.JSONToken.END_ARRAY) {
      res.add(new Cc(p));
    }
    return res;
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
