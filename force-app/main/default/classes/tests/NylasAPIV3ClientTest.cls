/**
 * @description       : Test class for NylasAPIV3Client.cls
 * @author            : Lincoln Rychecky
 * @group             :
 * @last modified on  : 08-19-2024
 * @last modified by  : Lincoln Rychecky
 **/

@isTest
public class NylasAPIV3ClientTest {
  @isTest
  static void testreturnAllCalendars() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.ReturnAllCalendarsParams params = new NylasAPIV3Client.ReturnAllCalendarsParams();
    params.calendarLimit = 10;
    params.page_token = 'page token';
    params.metadata_pair = 'key1:on-site';
    params.fieldSelect = 'desc';

    ReturnAllCalendarsResponse response = NylasAPIV3Client.returnAllCalendars(
      'grant-id',
      params
    );
    Test.stopTest();

    System.debug('ReturnAllCalendarsResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testcreateCalendar() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.CreateCalendarParams params = new NylasAPIV3Client.CreateCalendarParams();
    params.fieldSelect = 'id,updated_at';

    Calendar cal = new Calendar();
    cal.name = 'My New Calendar';
    cal.description = 'Description of my new calendar';
    cal.location = 'Location description';
    cal.timezone = 'America/Los_Angeles';

    CreateCalendarResponse response = NylasAPIV3Client.createCalendar(
      'grant-id',
      cal,
      params
    );
    Test.stopTest();

    System.debug('CreateCalendarReasponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testreturnCalendar() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.ReturnCalendarParams params = new NylasAPIV3Client.ReturnCalendarParams();
    params.fieldSelect = 'id,updated_at';

    ReturnCalendarResponse response = NylasAPIV3Client.returnCalendar(
      'grant-id',
      'calendar-id',
      params
    );
    Test.stopTest();

    System.debug('ReturnCalendarResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testupdateCalendar() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.UpdateCalendarParams params = new NylasAPIV3Client.UpdateCalendarParams();
    params.fieldSelect = 'id,updated_at';

    Calendar cal = new Calendar();
    cal.name = 'My New Calendar';
    cal.description = 'Description of my new calendar';
    cal.location = 'Location description';
    cal.timezone = 'America/Los_Angeles';

    UpdateCalendarResponse response = NylasAPIV3Client.updateCalendar(
      'grant-id',
      'calendar-id',
      cal,
      params
    );
    Test.stopTest();

    System.debug('UpdateCalendarResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testdeleteCalendar() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    DeleteCalendarResponse response = NylasAPIV3Client.deleteCalendar(
      'grant-id',
      'calendar-id'
    );
    Test.stopTest();

    System.debug('DeleteCalendarResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );
  }

  @isTest
  static void testgetAvailability() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.getAvailability();
    test.stopTest();
  }

  @isTest
  static void testgetFreeBusySchedule() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.getFreeBusySchedule();
    test.stopTest();
  }

  @isTest
  static void testreturnAllEvents() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.ReturnAllEventsParams params = new NylasAPIV3Client.ReturnAllEventsParams();
    params.eventLimit = 10;
    params.page_token = 'page token';
    params.metadata_pair = 'key1:on-site';
    params.selectFields = 'desc';
    params.calendar_id = 'calendar-id';
    params.show_cancelled = true;
    params.title = 'title';
    params.description = 'description';
    params.ical_uid = 'ical-uid';
    params.location = 'denver';
    params.start = 1724108627;
    params.endt = 1724108629;
    params.master_event_id = 'master-id';
    params.busy = false;
    params.updated_before = 1724108627;
    params.updated_after = 1724108629;
    params.attendees = 'lincoln.r@nylas.com';
    params.event_type = 'meeting';

    ReturnAllEventsResponse response = NylasAPIV3Client.returnAllEvents(
      'grant-id',
      params
    );
    Test.stopTest();

    System.debug('ReturnAllEventsResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testcreateEvent() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.CreateEventParams params = new NylasAPIV3Client.CreateEventParams();
    params.fieldSelect = 'id,updated_at';
    params.calendar_id = 'calendar-id';
    params.notify_participants = true;

    Event event = new Event();
    event.title = 'Birthday Party';
    event.busy = true;
    event.description = 'Come ready to skate';
    event.location = 'Roller Rink';

    Event.Participants participant = new Event.Participants();
    participant.email = 'aristotle@example.com';
    participant.name = 'Aristotle';

    event.participants = new List<Event.Participants>{ participant };

    CreateEventResponse response = NylasAPIV3Client.createEvent(
      'calendar-id',
      event,
      params
    );
    Test.stopTest();

    System.debug('CreateEventResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testreturnEvent() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.ReturnEventParams params = new NylasAPIV3Client.ReturnEventParams();
    params.fieldSelect = 'id,updated_at';
    params.calendar_id = 'calendar-id';

    ReturnEventResponse response = NylasAPIV3Client.returnEvent(
      'grant-id',
      'event-id',
      params
    );
    Test.stopTest();

    System.debug('ReturnEventResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testupdateEvent() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.UpdateEventParams params = new NylasAPIV3Client.UpdateEventParams();
    params.fieldSelect = 'id,updated_at';
    params.calendar_id = 'calendar-id';
    params.notify_participants = true;

    Event event = new Event();
    event.title = 'Birthday Party';
    event.busy = true;
    event.description = 'Come ready to skate';
    event.location = 'Roller Rink';

    Event.Participants participant = new Event.Participants();
    participant.email = 'aristotle@example.com';
    participant.name = 'Aristotle';

    event.participants = new List<Event.Participants>{ participant };

    UpdateEventResponse response = NylasAPIV3Client.updateEvent(
      'grant-id',
      'event-id',
      event,
      params
    );
    Test.stopTest();

    System.debug('UpdateEventResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testdeleteEvent() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.DeleteEventParams params = new NylasAPIV3Client.DeleteEventParams();
    params.calendar_id = 'calendar-id';
    params.notify_participants = true;

    DeleteEventResponse response = NylasAPIV3Client.deleteEvent(
      'grant-id',
      'event-id',
      params
    );
    Test.stopTest();

    System.debug('DeleteEventResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );
  }

  @isTest
  static void testsendRSVP() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.SendRSVPParams params = new NylasAPIV3Client.SendRSVPParams();
    params.calendar_id = 'calendar-id';

    SendRSVPResponse response = NylasAPIV3Client.sendRSVP(
      'grant-id',
      'event-id',
      'maybe',
      params
    );
    Test.stopTest();

    System.debug('SendRSVPResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testreturnAllRoomResources() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnAllRoomResources();
    test.stopTest();
  }

  @isTest
  static void testreturnAllDrafts() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnAllDrafts();
    test.stopTest();
  }

  @isTest
  static void testcreateDraft() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.createDraft();
    test.stopTest();
  }

  @isTest
  static void testreturnDraft() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnDraft();
    test.stopTest();
  }

  @isTest
  static void testupdateDraft() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.updateDraft();
    test.stopTest();
  }

  @isTest
  static void testsendDraft() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.sendDraft();
    test.stopTest();
  }

  @isTest
  static void testdeleteDraft() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.deleteDraft();
    test.stopTest();
  }

  @isTest
  static void testreturnAllMessages() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.ReturnAllMessagesParams params = new NylasAPIV3Client.ReturnAllMessagesParams();
    params.messageLimit = 10;
    params.page_token = 'page token';
    params.subject = 'subject';
    params.any_email = 'lincoln.r@nylas.com';
    params.to = 'milad@nylas.com';
    params.messageFrom = 'test@nylas.com';
    params.cc = 'test@nylas.com';
    params.bcc = 'test@nylas.com';
    params.inFolder = 'inbox';
    params.unread = true;
    params.starred = true;
    params.thread_id = 'thread-id';
    params.received_before = 1724108627;
    params.received_after = 1724108629;
    params.has_attachment = true;
    params.fields = 'desc';
    params.search_query_native = 'subject%3Afoo%20OR%20subject%3Abar';

    ReturnAllMessagesResponse response = NylasAPIV3Client.returnAllMessages(
      'grant-id',
      params
    );
    Test.stopTest();

    System.debug('ReturnAllMessagesResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testreturnMessage() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.ReturnMessageParams params = new NylasAPIV3Client.ReturnMessageParams();
    params.fields = 'desc';
    params.selectFields = 'desc';

    ReturnMessageResponse response = NylasAPIV3Client.returnMessage(
      'grant-id',
      'message-id',
      params
    );
    Test.stopTest();

    System.debug('ReturnMessageResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testupdateMessageAttributes() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.UpdateMessageAttributesParams params = new NylasAPIV3Client.UpdateMessageAttributesParams();
    params.selectFields = 'desc';

    NylasAPIV3Client.UpdateMessageAttributesData data = new NylasAPIV3Client.UpdateMessageAttributesData();
    data.starred = false;
    data.unread = false;
    data.folders = new List<String>{ 'inbox' };

    UpdateMessageAttributesResponse response = NylasAPIV3Client.updateMessageAttributes(
      'grant-id',
      'message-id',
      data,
      params
    );
    Test.stopTest();

    System.debug('UpdateMessageAttributesResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testdeleteMessage() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    DeleteMessageResponse response = NylasAPIV3Client.deleteMessage(
      'grant-id',
      'message-id'
    );
    Test.stopTest();

    System.debug('DeleteMessageResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );
  }

  // @isTest
  // static void testcleanEmailMessages() {
  //   Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

  //   Test.startTest();
  //   NylasAPIV3Client.CleanEmailMessagesParams params = new NylasAPIV3Client.CleanEmailMessagesParams();
  //   params.selectFields = 'desc';

  //   NylasAPIV3Client.CleanEmailMessagesData data = new NylasAPIV3Client.CleanEmailMessagesData();
  //   data.message_id = new List<String>{ 'message-id' };
  //   data.ignore_links = true;
  //   data.ignore_images = false;
  //   data.images_as_markdown = true;
  //   data.ignore_tables = true;
  //   data.remove_conclusion_phrases = true;

  //   CleanEmailMessagesResponse response = NylasAPIV3Client.cleanEmailMessages(
  //     'grant-id',
  //     data,
  //     params
  //   );
  //   Test.stopTest();

  //   System.debug('CleanEmailMessagesResponse: ' + response);

  //   System.assertEquals(
  //     '5fa64c92-e840-4357-86b9-2aa364d35b88',
  //     response.request_id,
  //     'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
  //   );

  //   System.assert(response.data != null, 'response.data should not be null');
  // }

  @isTest
  static void testsendMessage() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    Test.startTest();
    NylasAPIV3Client.SendMessageEmailAddress messageFrom = new NylasAPIV3Client.SendMessageEmailAddress();
    messageFrom.email = 'lincoln.r@nylas.com';
    messageFrom.name = 'Lincoln Rychecky';

    NylasAPIV3Client.SendMessageAttachment attachment = new NylasAPIV3Client.SendMessageAttachment();
    attachment.content = '{"data": "Hello World"}';
    attachment.content_type = 'json';
    attachment.filename = 'Lincoln Rychecky';

    NylasAPIV3Client.SendMessageData data = new NylasAPIV3Client.SendMessageData();
    data.subject = 'Hello World';
    data.body = 'Hello World';
    data.messageFrom = new List<NylasAPIV3Client.SendMessageEmailAddress>{
      messageFrom
    };
    data.to = new List<NylasAPIV3Client.SendMessageEmailAddress>{ messageFrom };
    data.cc = new List<NylasAPIV3Client.SendMessageEmailAddress>{ messageFrom };
    data.bcc = new List<NylasAPIV3Client.SendMessageEmailAddress>{
      messageFrom
    };
    data.reply_to = new List<NylasAPIV3Client.SendMessageEmailAddress>{
      messageFrom
    };
    data.reply_to_message_id = 'message-id';
    data.send_at = 1724108627;
    data.use_draft = false;
    data.attachments = new List<NylasAPIV3Client.SendMessageAttachment>{
      attachment
    };

    SendMessageResponse response = NylasAPIV3Client.sendMessage(
      'grant-id',
      data
    );
    Test.stopTest();

    System.debug('SendMessageResponse: ' + response);

    System.assertEquals(
      '5fa64c92-e840-4357-86b9-2aa364d35b88',
      response.request_id,
      'response.request_id should equal 5fa64c92-e840-4357-86b9-2aa364d35b88'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testreturnScheduledMessages() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());
    Test.startTest();
    List<nylas.ScheduledMessage> responses = NylasAPIV3Client.returnScheduledMessages(
      'grant-id'
    );
    Test.stopTest();

    System.debug('List<nylas.ScheduledMessage>: ' + responses);
  }

  @isTest
  static void testreturnScheduledMessage() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());
    Test.startTest();
    ScheduledMessage response = NylasAPIV3Client.returnScheduledMessage(
      'grant-id',
      'scheduled-id'
    );
    Test.stopTest();

    System.debug('ScheduledMessage: ' + response);

    System.assert(
      response.schedule_id != '',
      'response.schedule_id should not be empty'
    );
  }

  @isTest
  static void testcancelScheduledMessage() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());
    Test.startTest();
    CancelScheduledMessageResponse response = NylasAPIV3Client.cancelScheduledMessage(
      'grant-id',
      'scheduled-id'
    );
    Test.stopTest();

    System.debug('CancelScheduledMessageResponse: ' + response);

    System.assertEquals(
      '9c2ce8cd-d6e0-4206-a1d0-703f16880061',
      response.request_id,
      'response.request_id should equal 9c2ce8cd-d6e0-4206-a1d0-703f16880061'
    );
  }

  @isTest
  static void testcomposeMessage() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.composeMessage();
    test.stopTest();
  }

  @isTest
  static void testcomposeReply() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.composeReply();
    test.stopTest();
  }

  @isTest
  static void testreturnAllThreads() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnAllThreads();
    test.stopTest();
  }

  @isTest
  static void testreturnThread() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnThread();
    test.stopTest();
  }

  @isTest
  static void testupdateThread() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnThread();
    test.stopTest();
  }

  @isTest
  static void testdeleteThread() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.deleteThread();
    test.stopTest();
  }

  @isTest
  static void testreturnAllFolders() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnAllFolders();
    test.stopTest();
  }

  @isTest
  static void testreturnFolder() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnAllFolders();
    test.stopTest();
  }

  @isTest
  static void testcreateFolder() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.createFolder();
    test.stopTest();
  }

  @isTest
  static void testupdateFolder() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.updateFolder();
    test.stopTest();
  }

  @isTest
  static void testdeleteFolder() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.deleteFolder();
    test.stopTest();
  }

  @isTest
  static void testreturnAttachmentMetadata() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnAttachmentMetadata();
    test.stopTest();
  }

  @isTest
  static void testdownloadAttachment() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.downloadAttachment();
    test.stopTest();
  }

  @isTest
  static void testreturnAllContacts() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnAllContacts();
    test.stopTest();
  }

  @isTest
  static void testcreateContact() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.createContact();
    test.stopTest();
  }

  @isTest
  static void testreturnContact() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnContact();
    test.stopTest();
  }

  @isTest
  static void testupdateContact() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.updateContact();
    test.stopTest();
  }

  @isTest
  static void testdeleteContact() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.deleteContact();
    test.stopTest();
  }

  @isTest
  static void testreturnAllContactGroups() {
    Test.setMock(HttpCalloutMock.class, new NylasHTTPMock.NylasV3MockHTTP());

    test.startTest();
    NylasAPIV3Client.returnAllContactGroups();
    test.stopTest();
  }
}
