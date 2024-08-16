/**
 * @description       : Apex Client for Nylas API V3 CRUD Endpoints
 * @author            : Lincoln Rychecky
 * @last modified on  : 08-16-2024
 * @last modified by  : Lincoln Rychecky
 **/
public class NylasAPIV3Client {
  // CALENDAR ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Calendar)
  public class ReturnAllCalendarsParams {
    public Integer calendarLimit;
    public String page_token;
    public String metadata_pair;
    public String fieldSelect;
  }

  public static ReturnAllCalendarsResponse returnAllCalendars(
    String grantID,
    ReturnAllCalendarsParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/calendars';

    // Add the query parameters
    if (params.calendarLimit != null) {
      url += '?limit=' + params.calendarLimit;
    }

    // Add the query parameters
    if (params.page_token != null) {
      url += '?page_token=' + params.page_token;
    }

    // Add the query parameters
    if (params.metadata_pair != null) {
      url += '?metadata_pair=' + params.metadata_pair;
    }

    // Add the query parameters
    if (params.fieldSelect != null) {
      url += '?select=' + params.fieldSelect;
    }

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return ReturnAllCalendarsResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class CreateCalendarParams {
    public String fieldSelect;
  }

  public static CreateCalendarResponse createCalendar(
    String grantID,
    Calendar data,
    CreateCalendarParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/calendars';

    // Add the query parameters
    if (params.fieldSelect != null) {
      url += '?select=' + params.fieldSelect;
    }

    // Make POST request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.POST,
      url
    );

    // serialize the map into a JSON string
    req.setBody(JSON.serialize(data));

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return CreateCalendarResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class ReturnCalendarParams {
    public String fieldSelect;
  }

  public static ReturnCalendarResponse returnCalendar(
    String grantID,
    String calendarID,
    ReturnCalendarParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/calendars/' + calendarID;

    // Add the query parameters
    if (params.fieldSelect != null) {
      url += '?select=' + params.fieldSelect;
    }

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return ReturnCalendarResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class UpdateCalendarParams {
    public String fieldSelect;
  }

  public static UpdateCalendarResponse updateCalendar(
    String grantID,
    String calendarID,
    Calendar data,
    UpdateCalendarParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/calendars/' + calendarID;

    // Add the query parameters
    if (params.fieldSelect != null) {
      url += '?select=' + params.fieldSelect;
    }

    // Make PUT request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.PUT,
      url
    );

    // serialize the map into a JSON string
    req.setBody(JSON.serialize(data));

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return UpdateCalendarResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static DeleteCalendarResponse deleteCalendar(
    String grantID,
    String calendarID
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/calendars/' + calendarID;

    // Make DELETE request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.DEL,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return DeleteCalendarResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static void getAvailability() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getAvailability is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void getFreeBusySchedule() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getFreeBusySchedule is not currently implemented by the Nylas Apex SDK'
    );
  }

  // EVENTS ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Events)
  public class ReturnAllEventsParams {
    public Integer eventLimit;
    public String page_token;
    public String calendar_id;
    public Boolean show_cancelled;
    public String title;
    public String description;
    public String ical_uid;
    public String location;
    public Integer start;
    public Integer endt;
    public String master_event_id;
    public String metadata_pair;
    public Boolean busy;
    public Integer updated_before;
    public Integer updated_after;
    public String attendees;
    public String event_type;
    public String selectFields;
  }

  public static ReturnAllEventsResponse returnAllEvents(
    String grantID,
    ReturnAllEventsParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/events';

    // Add the query parameters
    if (params.eventLimit != null) {
      url += '?limit=' + params.eventLimit;
    }

    // Add the query parameters
    if (params.page_token != null) {
      url += '?page_token=' + params.page_token;
    }

    // Add the query parameters
    if (params.calendar_id != null) {
      url += '?calendar_id=' + params.calendar_id;
    }

    // Add the query parameters
    if (params.show_cancelled != null) {
      url += '?show_cancelled=' + params.show_cancelled;
    }

    // Add the query parameters
    if (params.title != null) {
      url += '?title=' + params.title;
    }

    // Add the query parameters
    if (params.description != null) {
      url += '?description=' + params.description;
    }

    // Add the query parameters
    if (params.ical_uid != null) {
      url += '?ical_uid=' + params.ical_uid;
    }

    // Add the query parameters
    if (params.location != null) {
      url += '?location=' + params.location;
    }

    // Add the query parameters
    if (params.start != null) {
      url += '?start=' + params.start;
    }

    // Add the query parameters
    if (params.endt != null) {
      url += '?end=' + params.endt;
    }

    // Add the query parameters
    if (params.master_event_id != null) {
      url += '?master_event_id=' + params.master_event_id;
    }

    // Add the query parameters
    if (params.metadata_pair != null) {
      url += '?metadata_pair=' + params.metadata_pair;
    }

    // Add the query parameters
    if (params.busy != null) {
      url += '?busy=' + params.busy;
    }

    // Add the query parameters
    if (params.updated_before != null) {
      url += '?updated_before=' + params.updated_before;
    }

    // Add the query parameters
    if (params.updated_after != null) {
      url += '?updated_after=' + params.updated_after;
    }

    // Add the query parameters
    if (params.attendees != null) {
      url += '?attendees=' + params.attendees;
    }

    // Add the query parameters
    if (params.event_type != null) {
      url += '?event_type=' + params.event_type;
    }

    // Add the query parameters
    if (params.selectFields != null) {
      url += '?select=' + params.selectFields;
    }

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return ReturnAllEventsResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class CreateEventParams {
    public String calendar_id;
    public Boolean notify_participants;
    public String fieldSelect;
  }

  public static CreateEventResponse createEvent(
    String grantID,
    CreateEventParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/events';

    // Add the query parameters
    if (params.calendar_id != null) {
      url += '?calendar_id=' + params.calendar_id;
    }

    // Add the query parameters
    if (params.notify_participants != null) {
      url += '?notify_participants=' + params.notify_participants;
    }

    // Add the query parameters
    if (params.fieldSelect != null) {
      url += '?select=' + params.fieldSelect;
    }

    // Make POST request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.POST,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return CreateEventResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class ReturnEventParams {
    public String calendar_id;
    public String fieldSelect;
  }
  public static ReturnEventResponse returnEvent(
    String grantID,
    String eventID,
    ReturnEventParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/events/' + eventID;

    // Add the query parameters
    if (params.calendar_id != null) {
      url += '?calendar_id=' + params.calendar_id;
    }

    // Add the query parameters
    if (params.fieldSelect != null) {
      url += '?select=' + params.fieldSelect;
    }

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return ReturnEventResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class UpdateEventParams {
    public String calendar_id;
    public Boolean notify_participants;
    public String fieldSelect;
  }

  public static UpdateEventResponse updateEvent(
    String grantID,
    String eventID,
    Event data,
    UpdateEventParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/events/' + eventID;

    // Add the query parameters
    if (params.calendar_id != null) {
      url += '?calendar_id=' + params.calendar_id;
    }

    // Add the query parameters
    if (params.notify_participants != null) {
      url += '?notify_participants=' + params.notify_participants;
    }

    // Add the query parameters
    if (params.fieldSelect != null) {
      url += '?select=' + params.fieldSelect;
    }

    // Make PUT request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.PUT,
      url
    );

    req.setBody(JSON.serialize(data));

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return UpdateEventResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class DeleteEventParams {
    public Boolean notify_participants;
    public String calendar_id;
  }

  public static DeleteEventResponse deleteEvent(
    String grantID,
    String eventID,
    DeleteEventParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/events/' + eventID;

    // Add the query parameters
    if (params.calendar_id != null) {
      url += '?calendar_id=' + params.calendar_id;
    }

    // Add the query parameters
    if (params.notify_participants != null) {
      url += '?notify_participants=' + params.notify_participants;
    }

    // Make DELETE request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.DEL,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return DeleteEventResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class SendRSVPParams {
    public String calendar_id;
  }

  public static SendRSVPResponse sendRSVP(
    String grantID,
    String eventID,
    String status,
    SendRSVPParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/events/' + eventID + '/send-rsvp';

    // Add the query parameters
    if (params.calendar_id != null) {
      url += '?calendar_id=' + params.calendar_id;
    }

    // Make POST request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.POST,
      url
    );

    req.setBody('{"status": "' + status + '"}');

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return SendRSVPResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  // ROOM RESOURCES ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Room-resources)
  public static void returnAllRoomResources() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnAllRoomResources is not currently implemented by the Nylas Apex SDK'
    );
  }

  // DRAFT ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Drafts)
  public static void returnAllDrafts() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnAllDrafts is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void createDraft() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'createDraft is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void returnDraft() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnDraft is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updateDraft() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updateDraft is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void sendDraft() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'sendDraft is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void deleteDraft() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'deleteDraft is not currently implemented by the Nylas Apex SDK'
    );
  }

  // MESSAGE ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Messages)
  public class ReturnAllMessagesParams {
    public Integer messageLimit;
    public String page_token;
    public String selectFields;
    public String subject;
    public String any_email;
    public String to;
    public String messageFrom;
    public String cc;
    public String bcc;
    public String inFolder;
    public Boolean unread;
    public Boolean starred;
    public String thread_id;
    public Integer received_before;
    public Integer received_after;
    public Boolean has_attachment;
    public String fields;
    public String search_query_native;
  }

  public static ReturnAllMessagesResponse returnAllMessages(
    String grantID,
    ReturnAllMessagesParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages';

    // Add the query parameters
    if (params.messageLimit != null) {
      url += '?limit=' + params.messageLimit;
    }

    if (params.page_token != null) {
      url += '?page_token=' + params.page_token;
    }

    if (params.selectFields != null) {
      url += '?select=' + params.selectFields;
    }

    if (params.subject != null) {
      url += '?subject=' + params.subject;
    }

    if (params.any_email != null) {
      url += '?any_email=' + params.any_email;
    }

    if (params.to != null) {
      url += '?to=' + params.to;
    }

    if (params.messageFrom != null) {
      url += '?from=' + params.messageFrom;
    }

    if (params.cc != null) {
      url += '?cc=' + params.cc;
    }

    if (params.bcc != null) {
      url += '?bcc=' + params.bcc;
    }

    if (params.inFolder != null) {
      url += '?in=' + params.inFolder;
    }

    if (params.unread != null) {
      url += '?unread=' + params.unread;
    }

    if (params.starred != null) {
      url += '?starred=' + params.starred;
    }

    if (params.thread_id != null) {
      url += '?thread_id=' + params.thread_id;
    }

    if (params.received_before != null) {
      url += '?received_before=' + params.received_before;
    }

    if (params.received_after != null) {
      url += '?received_after=' + params.received_after;
    }

    if (params.has_attachment != null) {
      url += '?has_attachment=' + params.has_attachment;
    }

    if (params.fields != null) {
      url += '?fields=' + params.fields;
    }

    if (params.search_query_native != null) {
      url += '?q=' + params.search_query_native;
    }

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return ReturnAllMessagesResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class ReturnMessageParams {
    public String fields;
    public String selectFields;
  }

  public static ReturnMessageResponse returnMessage(
    String grantID,
    String messageID,
    ReturnMessageParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages/' + messageID;

    // Add the query parameters
    if (params.fields != null) {
      url += '?fields=' + params.fields;
    }

    if (params.selectFields != null) {
      url += '?select=' + params.selectFields;
    }

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return ReturnMessageResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class UpdateMessageAttributesParams {
    public String selectFields;
  }

  public class UpdateMessageAttributesData {
    public Boolean starred;
    public Boolean unread;
    public List<String> folders;
  }

  public static UpdateMessageAttributesResponse updateMessageAttributes(
    String grantID,
    String messageID,
    UpdateMessageAttributesData data,
    UpdateMessageAttributesParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages/' + messageID;

    // Add the query parameters
    if (params.selectFields != null) {
      url += '?select=' + params.selectFields;
    }

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.PUT,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return UpdateMessageAttributesResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static DeleteMessageResponse deleteMessage(
    String grantID,
    String messageID
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages/' + messageID;

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.DEL,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return DeleteMessageResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class CleanEmailMessagesParams {
    public String selectFields;
  }

  public class CleanEmailMessagesData {
    public List<String> message_id;
    public Boolean ignore_links;
    public Boolean ignore_images;
    public Boolean images_as_markdown;
    public Boolean ignore_tables;
    public Boolean remove_conclusion_phrases;
  }

  public static CleanEmailMessagesResponse cleanEmailMessages(
    String grantID,
    CleanEmailMessagesData data,
    CleanEmailMessagesParams params
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages/clean';

    if (params.selectFields != null) {
      url += '?select=' + params.selectFields;
    }

    // Make PUT request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.PUT,
      url
    );

    req.setBody(JSON.serialize(data));

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return CleanEmailMessagesResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public class SendMessageData {
    public String subject;
    public String body;
    public List<SendMessageEmailAddress> messageFrom;
    public List<SendMessageEmailAddress> to;
    public List<SendMessageEmailAddress> cc;
    public List<SendMessageEmailAddress> bcc;
    public List<SendMessageEmailAddress> reply_to;
    public String reply_to_message_id;
    public Long send_at;
    public Boolean use_draft;
    public List<SendMessageAttachment> attachments;
  }

  public class SendMessageEmailAddress {
    public String name;
    public String email;
  }

  public class SendMessageAttachment {
    public String content;
    public String content_type;
    public String filename;
  }

  public static SendMessageResponse sendMessage(
    String grantID,
    SendMessageData data
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages/send';

    // Make POST request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.POST,
      url
    );

    req.setBody(JSON.serialize(data));

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return SendMessageResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static ReturnScheduledMessagesResponse returnScheduledMessages(
    String grantID
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages/schedules';

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return ReturnScheduledMessagesResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static ScheduledMessage returnScheduledMessage(
    String grantID,
    String scheduleID
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages/schedules/' + scheduleID;

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return ScheduledMessage.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static CancelScheduledMessageResponse cancelScheduledMessage(
    String grantID,
    String scheduleID
  ) {
    // Define the endpoint URL
    String url = '/v3/grants/' + grantID + '/messages/schedules/' + scheduleID;

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.DEL,
      url
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return CancelScheduledMessageResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  // SMART COMPOSE ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Smart-compose)
  public static void composeMessage() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'smartCompose is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void composeReply() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'composeReply is not currently implemented by the Nylas Apex SDK'
    );
  }

  // THREADS ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Threads)
  public static void returnAllThreads() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnAllThreads is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void returnThread() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnThread is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updateThread() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updateThread is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void deleteThread() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'deleteThread is not currently implemented by the Nylas Apex SDK'
    );
  }

  // FOLDERS ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Folders)
  public static void returnAllFolders() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnAllFolders is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void returnFolder() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnFolder is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void createFolder() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'createFolder is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updateFolder() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updateFolder is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void deleteFolder() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'deleteFolder is not currently implemented by the Nylas Apex SDK'
    );
  }

  // ATTACHMENTS ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Attachments)
  public static void returnAttachmentMetadata() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnAttachmentMetadata is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void downloadAttachment() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'downloadAttachment is not currently implemented by the Nylas Apex SDK'
    );
  }

  // CONTACTS ENDPOINTS (https://developer.nylas.com/docs/api/v3/ecc/#tag--Contacts)
  public static void returnAllContacts() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnAllContacts is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void createContact() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'createContact is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void returnContact() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnContact is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updateContact() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updateContact is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void deleteContact() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'deleteContact is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void returnAllContactGroups() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'returnAllContactGroups is not currently implemented by the Nylas Apex SDK'
    );
  }
}
