public class Event {
  public class Reminders {
    public Boolean use_default { get; set; }
    public List<Overrides> overrides { get; set; }

    public Reminders(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'use_default') {
              use_default = parser.getBooleanValue();
            } else if (text == 'overrides') {
              overrides = arrayOfOverrides(parser);
            } else {
              System.debug(
                LoggingLevel.WARN,
                'Reminders consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Details {
    public String meeting_code { get; set; }
    public String password { get; set; }
    public String url { get; set; }

    public Details(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'meeting_code') {
              meeting_code = parser.getText();
            } else if (text == 'password') {
              password = parser.getText();
            } else if (text == 'url') {
              url = parser.getText();
            } else {
              System.debug(
                LoggingLevel.WARN,
                'Details consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Conferencing {
    public String provider { get; set; }
    public Details details { get; set; }

    public Conferencing(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'provider') {
              provider = parser.getText();
            } else if (text == 'details') {
              details = new Details(parser);
            } else {
              System.debug(
                LoggingLevel.WARN,
                'Conferencing consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Organizer {
    public String email { get; set; }
    public String name { get; set; }

    public Organizer(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'email') {
              email = parser.getText();
            } else if (text == 'name') {
              name = parser.getText();
            } else {
              System.debug(
                LoggingLevel.WARN,
                'Organizer consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Overrides {
    public Integer reminder_minutes { get; set; }
    public String reminder_method { get; set; }

    public Overrides(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'reminder_minutes') {
              reminder_minutes = parser.getIntegerValue();
            } else if (text == 'reminder_method') {
              reminder_method = parser.getText();
            } else {
              System.debug(
                LoggingLevel.WARN,
                'Overrides consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class Participants {
    public String comment { get; set; }
    public String email { get; set; }
    public String name { get; set; }
    public String phone_number { get; set; }
    public String status { get; set; }

    public Participants(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'comment') {
              comment = parser.getText();
            } else if (text == 'email') {
              email = parser.getText();
            } else if (text == 'name') {
              name = parser.getText();
            } else if (text == 'phone_number') {
              phone_number = parser.getText();
            } else if (text == 'status') {
              status = parser.getText();
            } else {
              System.debug(
                LoggingLevel.WARN,
                'Participants consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public class When_Z {
    public Integer start_time { get; set; }
    public Integer end_time { get; set; }
    public String start_timezone { get; set; }
    public String end_timezone { get; set; }

    public When_Z(JSONParser parser) {
      while (parser.nextToken() != System.JSONToken.END_OBJECT) {
        if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
          String text = parser.getText();
          if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
            if (text == 'start_time') {
              start_time = parser.getIntegerValue();
            } else if (text == 'end_time') {
              end_time = parser.getIntegerValue();
            } else if (text == 'start_timezone') {
              start_timezone = parser.getText();
            } else if (text == 'end_timezone') {
              end_timezone = parser.getText();
            } else {
              System.debug(
                LoggingLevel.WARN,
                'When_Z consuming unrecognized property: ' + text
              );
              consumeObject(parser);
            }
          }
        }
      }
    }
  }

  public Boolean busy { get; set; }
  public String calendar_id { get; set; }
  public Conferencing conferencing { get; set; }
  public Integer created_at { get; set; }
  public String description { get; set; }
  public Boolean hide_participants { get; set; }
  public String grant_id { get; set; }
  public String html_link { get; set; }
  public String id { get; set; }
  public String location { get; set; }
  public Metadata metadata { get; set; }
  public String object_Z { get; set; } // in json: object
  public Organizer organizer { get; set; }
  public List<Participants> participants { get; set; }
  public Boolean read_only { get; set; }
  public Reminders reminders { get; set; }
  public String status { get; set; }
  public String title { get; set; }
  public Integer updated_at { get; set; }
  public String visibility { get; set; }
  public When_Z when_Z { get; set; } // in json: when

  public Event(JSONParser parser) {
    while (parser.nextToken() != System.JSONToken.END_OBJECT) {
      if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
        String text = parser.getText();
        if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
          if (text == 'busy') {
            busy = parser.getBooleanValue();
          } else if (text == 'calendar_id') {
            calendar_id = parser.getText();
          } else if (text == 'conferencing') {
            conferencing = new Conferencing(parser);
          } else if (text == 'created_at') {
            created_at = parser.getIntegerValue();
          } else if (text == 'description') {
            description = parser.getText();
          } else if (text == 'hide_participants') {
            hide_participants = parser.getBooleanValue();
          } else if (text == 'grant_id') {
            grant_id = parser.getText();
          } else if (text == 'html_link') {
            html_link = parser.getText();
          } else if (text == 'id') {
            id = parser.getText();
          } else if (text == 'location') {
            location = parser.getText();
          } else if (text == 'metadata') {
            metadata = new Metadata(parser);
          } else if (text == 'object') {
            object_Z = parser.getText();
          } else if (text == 'organizer') {
            organizer = new Organizer(parser);
          } else if (text == 'participants') {
            participants = arrayOfParticipants(parser);
          } else if (text == 'read_only') {
            read_only = parser.getBooleanValue();
          } else if (text == 'reminders') {
            reminders = new Reminders(parser);
          } else if (text == 'status') {
            status = parser.getText();
          } else if (text == 'title') {
            title = parser.getText();
          } else if (text == 'updated_at') {
            updated_at = parser.getIntegerValue();
          } else if (text == 'visibility') {
            visibility = parser.getText();
          } else if (text == 'when') {
            when_Z = new When_Z(parser);
          } else {
            System.debug(
              LoggingLevel.WARN,
              'Event consuming unrecognized property: ' + text
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

  private static List<Overrides> arrayOfOverrides(System.JSONParser p) {
    List<Overrides> res = new List<Overrides>();
    if (p.getCurrentToken() == null)
      p.nextToken();
    while (p.nextToken() != System.JSONToken.END_ARRAY) {
      res.add(new Overrides(p));
    }
    return res;
  }

  private static List<Participants> arrayOfParticipants(System.JSONParser p) {
    List<Participants> res = new List<Participants>();
    if (p.getCurrentToken() == null)
      p.nextToken();
    while (p.nextToken() != System.JSONToken.END_ARRAY) {
      res.add(new Participants(p));
    }
    return res;
  }
}
