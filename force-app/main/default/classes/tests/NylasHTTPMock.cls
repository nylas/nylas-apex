/**
 * @description       : Nylas API V3 Admin Mock HTTP Callouts for Apex Testing.
 * @author            : Lincoln Rychecky
 * @group             :
 * @last modified on  : 08-16-2024
 * @last modified by  : Lincoln Rychecky
 **/
public class NylasHTTPMock {
  private Nylas_V3_Setting__mdt nylasSettings = NylasConfig.getNylasConfig()
    .nylasSettings;

  private String baseURL = nylasSettings.Region__c == 'US' ||
    nylasSettings.Region__c == null
    ? 'https://api.us.nylas.com'
    : 'https://api.eu.nylas.com';

  public static final map<String, Object> testGoogleServiceAccount = new Map<String, Object>{
    'type' => 'service_account',
    'project_id' => 'nylas-salesforce-int',
    'private_key_id' => '630ffe725012b83514a4b6dff905498df4358c33',
    'private_key' => '-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANLkkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIPIQC6kXSeuT0YqtIJ\nJOoHAIt2mX/AlkbWMRWVUNG3lMSpxMc3wfIIsMruxgGKDsfAHJPQROPWJSe6aGmz\n78V/6740JIKAbTF2h21zYq6LceHC+JxWuGsFJ5KZMx7KsgX4Z9s98ndzGGGWPgmP\nbW7qt1JuYIi4jmXHrB6F4T7Z4QaU9TD9yonR1Biw/bNrq3HY+N6QeEtDBZV/Nivr\n+CtTeZ3cZ+dv6+BK0+CMqm/pqoXu617QNR9U75YNLTKU7Rqf2urpu1rDOXPM9vFs\nvuoTx94pgP7e4c5ZBfZ4SjEP+Iri8b0VtoMJrTNIQ2zA1h9KpUuskdPvJd4CcT1N\nl6Wvyw9tAgMBAAECggEACCl3jmoXv/FnaLNygLBc98yjx+tZWY2F88HjKt8ZgMr1\nRuD3dxAWu1qPFyBBP4wc9Dx5+W986XQf70QuiRRbKPhf7TLZujqlLdTgP0I5EVb8\nWNfHr7J81gfWDejz47DVr+7EDbHcsxO9f1TXLA50pEzgZz06rOSyVnu8ofOJXp9G\naWGjesUoucc1NaUF1y08WipuXjNjsJy84s9ezi342no44tweXMlnsGylQC4ZT7g+\nsmC3YC1aMRKCidcmJaowR6mwKZ7ey87NUZMeZu0KXtaBF7bubmlIkD34AizlbDhC\ncAzDgl5LhlMk2Qe3akoQbHn+NgOkRA3XblH6NQLJUQKBgQD09kFNQlSIjKXDHnjV\no2MsgcSy0XkcGQcGFrtXdUZeaAKGwpExMtT0M9VMJ2cqfm3K8q/GH5joGa8BdSo9\nQmDuN+j44qdBIJ5B68GD/ZCupZw3Yb9QfGn6PqxM9l+4qwjhHnWyMDhEqkQ+Nt/9\noTT8SEIEI6DiygByi+vIUsivVwKBgQDC+ZpDbdRA6LRpsoyUX7E9CzLux1jLvioi\nBiUST5YvvUxatRUMggMMKzS/PtlO2yP+dbiK7oR2Iz/N1/s3fmJSFmc2SWwu8SJq\nqJhJXx/vKLOeBQKDaqm6X143Q6kMS4/FHrsAd9UTWUOrpXOcisowkZz+qS+yHEZ+\n07iENHFw2wKBgQDtcQlpPwM7fMFsOUw9IOuPh5XHEv6GusexIjWjl5yHA+B3CX+9\nJZ1/vAJjl8oLSZNY5hZ1P8lyKPsWuaAg0werwOwE24XtvhVIpqHkM9ObRhH/KLNN\n69q54ygWTbYJBVhNBb5l4xGXlUci2wQRD8KRS+UZqANZ8R2v6mq4uW2nbwKBgQCe\ndNiIYGQV9IlbNX7GvxZ+M/HK2TwzKXN4f2H1hbTbS48YUP6wUaFEbIDLxLo7OiIA\nlY/LaZlBodgi5JsIOLCTYh2zouxHIjYEVMyfJK4BYiTIEe4++5rBGuypIVXr5iUL\n4LO956XFudAjWa2h1bII0u6ykLFwoUYxoMPevfhL7QKBgAdgqF8QqDhHAVzOmVzB\nYJbPAbrAmBkmix/EkMAHEdC2PHBQuWuoAi9n10sIl+wu6SUzdiPbuJoodEk6b3lW\niL8lMsSIv7jIUhLS1uZ6t7JSefQJmrc4EFWVtc60kPz5CAtG+qr8Se1ykuc2i5TR\nUMu2ano/N6XBxCtwzuRK+UJT\n-----END PRIVATE KEY-----\n',
    'client_email' => 'nylas-salesforce-integration@nylas-salesforce-int.iam.gserviceaccount.com',
    'client_id' => '102248971899384759123',
    'auth_uri' => 'https://accounts.google.com/o/oauth2/auth',
    'token_uri' => 'https://oauth2.googleapis.com/token',
    'auth_provider_x509_cert_url' => 'https://www.googleapis.com/oauth2/v1/certs',
    'client_x509_cert_url' => 'https://www.googleapis.com/robot/v1/metadata/x509/nylas-salesforce-integration%40nylas-salesforce-int.iam.gserviceaccount.com'
  };

  public class NylasAdminV3MockHTTP implements HttpCalloutMock {
    private NylasHTTPMock nylasMock = new NylasHTTPMock();

    public HTTPResponse respond(HTTPRequest req) {
      // Create a new response
      HttpResponse res = new HttpResponse();
      res.setHeader('Content-Type', 'application/json');

      String requestEndpoint = nylasMock.extractRequestEndpoint(req);
      String requestMethod = req.getMethod();

      System.debug(LoggingLevel.INFO, 'requestEndpoint: ' + requestEndpoint);
      System.debug(LoggingLevel.INFO, 'requestMethod: ' + requestMethod);

      switch on requestMethod {
        when 'GET' {
          // https://developer.nylas.com/docs/api/v3/admin/#get-/v3/connect/tokeninfo
          if (requestEndpoint == '/v3/connect/tokeninfo') {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": {"iss": "https://nylas.com","aud": "http://localhost: 3030","sub": "Jaf84d88-£274-46cc-bbc9-aed7dac061c7","email": "user@example.com","iat": 1692094848,"exp": 1692095173}}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#get-/v3/grants
          else if (requestEndpoint == '/v3/grants') {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": [{"id": "e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47","provider": "microsoft","account_id": "df0yq6c9okc6t9j4ejd5nyrt7","grant_status": "valid","email": "email@example.com","scope": ["Mail.Read","User.Read","offline_access"],"user_agent": "string","ip": "string","state": "my-state","created_at": 1617817109,"updated_at": 1617817109}],"limit": 10,"offset": 0}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#get-/v3/grants/-grantId-
          else if (matchesGrantIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": {"id": "e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47","provider": "microsoft","account_id": "df0yq6c9okc6t9j4ejd5nyrt7","grant_status": "valid","email": "email@example.com","scope": ["Mail.Read","User.Read","offline_access"],"user_agent": "string","ip": "string","state": "my-state","created_at": 1617817109,"updated_at": 1617817109}}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#get-/v3/grants/me
          else if (requestEndpoint == '/v3/grants/me') {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": {"id": "e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47","provider": "microsoft","account_id": "df0yq6c9okc6t9j4ejd5nyrt7","grant_status": "valid","email": "email@example.com","scope": ["Mail.Read","User.Read","offline_access"],"user_agent": "string","ip": "string","state": "my-state","created_at": 1617817109,"updated_at": 1617817109}}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#get-/v3/connectors/-provider-/creds
          else if (matchesCredentialsProviderPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": [{"id": "e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47","name": "My first Google credential","created_at": 1617817109,"updated_at": 1617817109}],"limit": 10,"offset": 0}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#get-/v3/connectors/-provider-/creds/-id-
          else if (matchesCredentialsIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": {"id": "e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47","name": "My first Google credential","created_at": 1617817109,"updated_at": 1617817109}}'
            );
            res.setStatusCode(200);
          }
        }
        when 'POST' {
          // https://developer.nylas.com/docs/api/v3/admin/#post-/v3/connect/token
          if (requestEndpoint == '/v3/connect/token') {
            res.setBody(
              '{"access_token": "<NYLAS_ACCESS_TOKEN>","expires_in": 3600,"id_token": "<JWT_TOKEN>","email": "example@gmail.com","refresh_token": "<REFRESH_TOKEN>","scope": "https://www.googleapis.com/auth/gmail.readonly profile","token_type": "Bearer","grant_id": "<NYLAS_GRANT_ID>","provider": "google"}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#post-/v3/connect/revoke
          else if (requestEndpoint == '/v3/connect/revoke') {
            res.setBody('{}');
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#post-/v3/connectors/-provider-/creds
          else if (matchesCredentialsProviderPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": {"id": "e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47","name": "My first Google credential","created_at": 1617817109,"updated_at": 1617817109}}'
            );
            res.setStatusCode(201);
          }
        }
        when 'PUT' {
        }
        when 'DELETE' {
          // https://developer.nylas.com/docs/api/v3/admin/#delete-/v3/grants/-grantId-
          if (matchesGrantIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90"}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#delete-/v3/connectors/-provider-/creds/-id-
          else if (matchesCredentialsIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90"}'
            );
            res.setStatusCode(200);
          }
        }
        when 'PATCH' {
          // https://developer.nylas.com/docs/api/v3/admin/#patch-/v3/grants/-grantId-
          if (matchesGrantIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": {"id": "e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47","provider": "microsoft","account_id": "df0yq6c9okc6t9j4ejd5nyrt7","grant_status": "valid","email": "email@example.com","scope": ["Mail.Read","User.Read","offline_access"],"user_agent": "string","ip": "string","state": "my-state","created_at": 1617817109,"updated_at": 1617817109}}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/admin/#patch-/v3/connectors/-provider-/creds/-id-
          else if (matchesCredentialsIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90","data": {"id": "e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47","name": "My first Google credential","created_at": 1617817109,"updated_at": 1617817109}}'
            );
            res.setStatusCode(200);
          }
        }
      }
      return res;
    }

    // HELPER METHODS for matching endpoint patterns
    private Boolean matchesCredentialsProviderPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/connectors/[a-z-]+/creds$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesCredentialsIDPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/connectors/[a-z-]+/creds/[a-zA-Z0-9-]+$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesGrantIDPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+$';

      return nylasMock.compileMatchRegex(pattern, url);
    }
  }

  public class NylasV3MockHTTP implements HttpCalloutMock {
    private NylasHTTPMock nylasMock = new NylasHTTPMock();

    public HTTPResponse respond(HTTPRequest req) {
      // Create a new response
      HttpResponse res = new HttpResponse();
      res.setHeader('Content-Type', 'application/json');

      NylasHTTPMock nylasMock = new NylasHTTPMock();

      String requestEndpoint = nylasMock.extractRequestEndpoint(req);
      String requestMethod = req.getMethod();

      System.debug(LoggingLevel.INFO, 'requestEndpoint: ' + requestEndpoint);
      System.debug(LoggingLevel.INFO, 'requestMethod: ' + requestMethod);

      switch on requestMethod {
        when 'GET' {
          //https://developer.nylas.com/docs/api/v3/ecc/#get-/v3/grants/-grant_id-/calendars
          if (matchesReturnAllCalendarsPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": [ { "description": "Description of my new calendar", "hex_color": "#039BE5", "hex_foreground_color": "#039BE5", "id": "5d3qmne77v32r8l4phyuksl2x", "is_owned_by_user": true, "is_primary": true, "location": "Los Angeles, CA", "metadata": { "your-key": "value" }, "name": "My New Calendar", "object": "calendar", "read_only": false, "timezone": "America/Los_Angeles" }], "next_cursor": "CigKGjRlaDdyNGQydTFqbWJ0bGo5a2QxdWJtdDZnGAEggIDAu7fw7bEYGg8IABIAGPjh2PGEi_0CIAEiBwgCEOqs6i4=" }'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#get-/v3/grants/-grant_id-/calendars/-calendar_id-
          else if (matchesCalendarIDPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "description": "Description of my new calendar", "hex_color": "#039BE5", "hex_foreground_color": "#039BE5", "id": "5d3qmne77v32r8l4phyuksl2x", "is_owned_by_user": true, "is_primary": true, "location": "Los Angeles, CA", "metadata": { "your-key": "value" }, "name": "My New Calendar", "object": "calendar", "read_only": false, "timezone": "America/Los_Angeles" }}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#get-/v3/grants/-grant_id-/events
          else if (matchesEventGrantPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": [ { "busy": true, "calendar_id": "7d93zl2palhxqdy6e5qinsakt", "conferencing": { "provider": "Zoom Meeting", "details": { "meeting_code": "code-123456", "password": "password-123456", "url": "https://zoom.us/j/1234567890?pwd=1234567890" }}, "created_at": 1661874192, "description": "Description of my new calendar", "hide_participants": false, "grant_id": "41009df5-bf11-4c97-aa18-b285b5f2e386", "html_link": "https://www.google.com/calendar/event?eid=bTMzcGJrNW4yYjk4bjk3OWE4Ef3feD2VuM29fMjAyMjA2MjdUMjIwMDAwWiBoYWxsYUBueWxhcy5jb20", "id": "5d3qmne77v32r8l4phyuksl2x", "location": "Roller Rink", "metadata": { "your_key": "your_value" }, "object": "event", "organizer": { "email": "organizer@example.com", "name": "" }, "participants": [ { "comment": "Aristotle", "email": "aristotle@example.com", "name": "Aristotle", "phone_number": "+1 23456778", "status": "maybe" }], "read_only": false, "reminders": { "use_default": false, "overrides": [ { "reminder_minutes": 10, "reminder_method": "email" }]}, "status": "confirmed", "title": "Birthday Party", "updated_at": 1661874192, "visibility": "private", "when": { "start_time": 1661874192, "end_time": 1661877792, "start_timezone": "America/New_York", "end_timezone": "America/New_York" }}], "next_cursor": "CigKGjRlaDdyNGQydTFqbWJ0bGo5a2QxdWJtdDZnGAEggIDAu7fw7bEYGg8IABIAGPjh2PGEi_0CIAEiBwgCEOqs6i4=" }'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#get-/v3/grants/-grant_id-/events/-event_id-
          else if (matchesEventIDPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "busy": true, "calendar_id": "7d93zl2palhxqdy6e5qinsakt", "conferencing": { "provider": "Zoom Meeting", "details": { "meeting_code": "code-123456", "password": "password-123456", "url": "https://zoom.us/j/1234567890?pwd=1234567890" }}, "created_at": 1661874192, "description": "Description of my new calendar", "hide_participants": false, "grant_id": "41009df5-bf11-4c97-aa18-b285b5f2e386", "html_link": "https://www.google.com/calendar/event?eid=bTMzcGJrNW4yYjk4bjk3OWE4Ef3feD2VuM29fMjAyMjA2MjdUMjIwMDAwWiBoYWxsYUBueWxhcy5jb20", "id": "5d3qmne77v32r8l4phyuksl2x", "location": "Roller Rink", "metadata": { "your_key": "your_value" }, "object": "event", "organizer": { "email": "organizer@example.com", "name": "" }, "participants": [ { "comment": "Aristotle", "email": "aristotle@example.com", "name": "Aristotle", "phone_number": "+1 23456778", "status": "maybe" }], "read_only": false, "reminders": { "use_default": false, "overrides": [ { "reminder_minutes": 10, "reminder_method": "email" }]}, "recurrence": [ "RRULE:FREQ=WEEKLY;BYDAY=MO", "EXDATE:20211011T000000Z" ], "status": "confirmed", "title": "Birthday Party", "updated_at": 1661874192, "visibility": "private", "when": { "start_time": 1661874192, "end_time": 1661877792, "start_timezone": "America/New_York", "end_timezone": "America/New_York" }}}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#get-/v3/grants/-grant_id-/messages
          else if (matchesMessageGrantPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": [ { "body": "Hello, I just sent a message using Nylas!", "cc": [ { "name": "Arya Stark", "email": "arya.stark@example.com" } ], "date": 1635355739, "attachments": [ { "content_type": "text/calendar", "id": "4kj2jrcoj9ve5j9yxqz5cuv98", "size": 1708 }, { "content_type": "application/ics", "filename": "invite.ics", "id": "70jcsv367jaiavt4njeu4xswg", "size": 1708 } ], "folders": [ "8l6c4d11y1p4dm4fxj52whyr9", "d9zkcr2tljpu3m4qpj7l2hbr0" ], "from": [ { "name": "Daenerys Targaryen", "email": "daenerys.t@example.com" } ], "grant_id": "41009df5-bf11-4c97-aa18-b285b5f2e386", "id": "5d3qmne77v32r8l4phyuksl2x", "object": "message", "reply_to": [ { "name": "Daenerys Targaryen", "email": "daenerys.t@example.com" } ], "snippet": "Hello, I just sent a message using Nylas!", "starred": true, "subject": "Hello from Nylas!", "thread_id": "1t8tv3890q4vgmwq6pmdwm8qgsaer", "to": [ { "name": "Jon Snow", "email": "j.snow@example.com" } ], "unread": true } ], "next_cursor": "CigKGjRlaDdyNGQydTFqbWJ0bGo5a2QxdWJtdDZnGAEggIDAu7fw7bEYGg8IABIAGPjh2PGEi_0CIAEiBwgCEOqs6i4=" }'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#get-/v3/grants/-grant_id-/messages/-message_id-
          else if (matchesMessageIDPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "body": "Hello, I just sent a message using Nylas!", "cc": [ { "name": "Arya Stark", "email": "arya.stark@example.com" } ], "date": 1635355739, "attachments": [ { "content_type": "text/calendar", "id": "4kj2jrcoj9ve5j9yxqz5cuv98", "size": 1708 }, { "content_type": "application/ics", "filename": "invite.ics", "id": "70jcsv367jaiavt4njeu4xswg", "size": 1708 } ], "folders": [ "8l6c4d11y1p4dm4fxj52whyr9", "d9zkcr2tljpu3m4qpj7l2hbr0" ], "from": [ { "name": "Daenerys Targaryen", "email": "daenerys.t@example.com" } ], "grant_id": "41009df5-bf11-4c97-aa18-b285b5f2e386", "id": "5d3qmne77v32r8l4phyuksl2x", "object": "message", "reply_to": [ { "name": "Daenerys Targaryen", "email": "daenerys.t@example.com" } ], "snippet": "Hello, I just sent a message using Nylas!", "starred": true, "subject": "Hello from Nylas!", "thread_id": "1t8tv3890q4vgmwq6pmdwm8qgsaer", "to": [ { "name": "Jon Snow", "email": "j.snow@example.com" } ], "unread": true } }'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#get-/v3/grants/-grant_id-/messages/schedules
          else if (matchesScheduledMessageGrantPattern(requestEndpoint)) {
            res.setBody(
              '[ { "schedule_id": "8cd56334-6d95-432c-86d1-c5dab0ce98be", "status": { "code": "pending", "description": "schedule send awaiting send at time" } }, { "schedule_id": "rb856334-6d95-432c-86d1-c5dab0ce98be", "status": { "code": "sucess", "description": "schedule send succeeded" }, "close_time": 1690579819 } ]'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#get-/v3/grants/-grant_id-/messages/schedules/-scheduleId-
          else if (matchesScheduledMessageIDPattern(requestEndpoint)) {
            res.setBody(
              '{"schedule_id": "8cd56334-6d95-432c-86d1-c5dab0ce98be","status": {"code": "pending","description": "schedule send awaiting send at time"}}'
            );
            res.setStatusCode(200);
          }
        }
        when 'POST' {
          //https://developer.nylas.com/docs/api/v3/ecc/#post-/v3/grants/-grant_id-/calendars
          if (matchesReturnAllCalendarsPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "description": "Description of my new calendar", "hex_color": "#039BE5", "hex_foreground_color": "#039BE5", "id": "5d3qmne77v32r8l4phyuksl2x", "is_owned_by_user": true, "is_primary": true, "location": "Los Angeles, CA", "metadata": { "your-key": "value" }, "name": "My New Calendar", "object": "calendar", "read_only": false, "timezone": "America/Los_Angeles" }}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#post-/v3/grants/-grant_id-/events
          else if (matchesEventGrantPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "busy": true, "calendar_id": "7d93zl2palhxqdy6e5qinsakt", "conferencing": { "provider": "Zoom Meeting", "details": { "meeting_code": "code-123456", "password": "password-123456", "url": "https://zoom.us/j/1234567890?pwd=1234567890" }}, "created_at": 1661874192, "description": "Description of my new calendar", "hide_participants": false, "grant_id": "41009df5-bf11-4c97-aa18-b285b5f2e386", "html_link": "https://www.google.com/calendar/event?eid=bTMzcGJrNW4yYjk4bjk3OWE4Ef3feD2VuM29fMjAyMjA2MjdUMjIwMDAwWiBoYWxsYUBueWxhcy5jb20", "id": "5d3qmne77v32r8l4phyuksl2x", "location": "Roller Rink", "metadata": { "your_key": "your_value" }, "object": "event", "organizer": { "email": "organizer@example.com", "name": "" }, "participants": [ { "comment": "Aristotle", "email": "aristotle@example.com", "name": "Aristotle", "phone_number": "+1 23456778", "status": "maybe" }], "read_only": false, "reminders": { "use_default": false, "overrides": [ { "reminder_minutes": 10, "reminder_method": "email" }]}, "recurrence": [ "RRULE:FREQ=WEEKLY;BYDAY=MO", "EXDATE:20211011T000000Z" ], "status": "confirmed", "title": "Birthday Party", "updated_at": 1661874192, "visibility": "private", "when": { "start_time": 1661874192, "end_time": 1661877792, "start_timezone": "America/New_York", "end_timezone": "America/New_York" }}}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#post-/v3/grants/-grant_id-/events/-event_id-/send-rsvp
          else if (matchesEventRSVPPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "send_ics_error": { "type": "provider_error", "message": "Request had insufficient authentication scopes." }}}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#post-/v3/grants/-grant_id-/messages/send
          else if (matchesSendMessage(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "grant_id": "your grant_id", "data": { "subject": "Sending Emails with Nylas", "body": "Nylas API v3 Test!", "from": [ { "name": "John Doe", "email": "john.doe@example.com" } ], "to": [ { "name": "Jane Doe", "email": "jane.doe@example.com" }, { "name": "Scott", "email": "scott@example.com" }, { "name": "Tom", "email": "tom@example.com" } ], "attachments": [ { "content": "HASKDJhiuahsdjlkhKJAsd=", "content_type": "text/plain", "filename": "myfile.txt" } ], "schedule_id": "", "reply_to_message_id": "<the message ID you replied to>" } }'
            );
            res.setStatusCode(200);
          }
        }
        when 'PUT' {
          // https://developer.nylas.com/docs/api/v3/ecc/#put-/v3/grants/-grant_id-/calendars/-calendar_id-
          if (matchesCalendarIDPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "description": "Description of my new calendar", "hex_color": "#039BE5", "hex_foreground_color": "#039BE5", "id": "5d3qmne77v32r8l4phyuksl2x", "is_owned_by_user": true, "is_primary": true, "location": "Los Angeles, CA", "metadata": { "your-key": "value" }, "name": "My New Calendar", "object": "calendar", "read_only": false, "timezone": "America/Los_Angeles" }}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#put-/v3/grants/-grant_id-/events/-event_id-
          else if (matchesEventIDPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "busy": true, "calendar_id": "7d93zl2palhxqdy6e5qinsakt", "conferencing": { "provider": "Zoom Meeting", "details": { "meeting_code": "code-123456", "password": "password-123456", "url": "https://zoom.us/j/1234567890?pwd=1234567890" }}, "created_at": 1661874192, "description": "Description of my new calendar", "hide_participants": false, "grant_id": "41009df5-bf11-4c97-aa18-b285b5f2e386", "html_link": "https://www.google.com/calendar/event?eid=bTMzcGJrNW4yYjk4bjk3OWE4Ef3feD2VuM29fMjAyMjA2MjdUMjIwMDAwWiBoYWxsYUBueWxhcy5jb20", "id": "5d3qmne77v32r8l4phyuksl2x", "location": "Roller Rink", "metadata": { "your_key": "your_value" }, "object": "event", "organizer": { "email": "organizer@example.com", "name": "" }, "participants": [ { "comment": "Aristotle", "email": "aristotle@example.com", "name": "Aristotle", "phone_number": "+1 23456778", "status": "maybe" }], "read_only": false, "reminders": { "use_default": false, "overrides": [ { "reminder_minutes": 10, "reminder_method": "email" }]}, "recurrence": [ "RRULE:FREQ=WEEKLY;BYDAY=MO", "EXDATE:20211011T000000Z" ], "status": "confirmed", "title": "Birthday Party", "updated_at": 1661874192, "visibility": "private", "when": { "start_time": 1661874192, "end_time": 1661877792, "start_timezone": "America/New_York", "end_timezone": "America/New_York" }}}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#put-/v3/grants/-grant_id-/messages/-message_id-
          else if (matchesMessageIDPattern(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": { "body": "Hello, I just sent a message using Nylas!", "cc": [ { "name": "Arya Stark", "email": "arya.stark@example.com" } ], "date": 1635355739, "attachments": [ { "content_type": "text/calendar", "id": "4kj2jrcoj9ve5j9yxqz5cuv98", "size": 1708 }, { "content_type": "application/ics", "filename": "invite.ics", "id": "70jcsv367jaiavt4njeu4xswg", "size": 1708 } ], "folders": [ "8l6c4d11y1p4dm4fxj52whyr9", "d9zkcr2tljpu3m4qpj7l2hbr0" ], "from": [ { "name": "Daenerys Targaryen", "email": "daenerys.t@example.com" } ], "grant_id": "41009df5-bf11-4c97-aa18-b285b5f2e386", "id": "5d3qmne77v32r8l4phyuksl2x", "object": "message", "reply_to": [ { "name": "Daenerys Targaryen", "email": "daenerys.t@example.com" } ], "snippet": "Hello, I just sent a message using Nylas!", "starred": true, "subject": "Hello from Nylas!", "thread_id": "1t8tv3890q4vgmwq6pmdwm8qgsaer", "to": [ { "name": "Jon Snow", "email": "j.snow@example.com" } ], "unread": true } }'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#put-/v3/grants/-grant_id-/messages/clean
          else if (matchesCleanEmailMessages(requestEndpoint)) {
            res.setBody(
              '{ "request_id": "5fa64c92-e840-4357-86b9-2aa364d35b88", "data": [ { "body": "<div dir=\"ltr\"><div>Hello, I just sent a message using Nylas! <br></div><img src=\"cid:ii_ltppe5ph0\" alt=\"Nylas-Logo-Stacked-Blue_.png\" width=\"540\" height=\"464\"><br><div dir=\"ltr\" class=\"gmail_signature\" data-smartmail=\"gmail_signature\"><div dir=\"ltr\"></div></div></div>\r\n", "cc": [ { "name": "Arya Stark", "email": "arya.stark@example.com" } ], "date": 1635355739, "attachments": [ { "is_inline": true, "id": "v0:TnlsYXMtTG9nby1TdGFja2VkLUJsdWVfLnBuZw==:aW1hZ2UvcG5nOyBuYW1lPSJOeWxhcy1Mb2dvLVN0YWNrZWQtQmx1ZV8ucG5nIg==:26044", "grant_id": "nylas_test_9", "filename": "Nylas-Logo-Stacked-Blue_.png", "content_type": "image/png; name=\"Nylas-Logo-Stacked-Blue_.png\"", "content_disposition": "inline; filename=\"Nylas-Logo-Stacked-Blue_.png\"", "content_id": "ii_ltppe5ph0", "size": 26044 } ], "folders": [ "8l6c4d11y1p4dm4fxj52whyr9", "d9zkcr2tljpu3m4qpj7l2hbr0" ], "from": [ { "name": "Daenerys Targaryen", "email": "daenerys.t@example.com" } ], "grant_id": "41009df5-bf11-4c97-aa18-b285b5f2e386", "id": "5d3qmne77v32r8l4phyuksl2x", "object": "message", "reply_to": [ { "name": "Daenerys Targaryen", "email": "daenerys.t@example.com" } ], "snippet": "Hello, I just sent a message using Nylas!", "starred": true, "subject": "Hello from Nylas!", "thread_id": "1t8tv3890q4vgmwq6pmdwm8qgsaer", "to": [ { "name": "Jon Snow", "email": "j.snow@example.com" } ], "unread": true, "conversation": "Hello, I just sent a message using Nylas!" } ] }'
            );
            res.setStatusCode(200);
          }
        }
        when 'DELETE' {
          // https://developer.nylas.com/docs/api/v3/ecc/#delete-/v3/grants/-grant_id-/calendars/-calendar_id-
          if (matchesCalendarIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90"}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#delete-/v3/grants/-grant_id-/events/-event_id-
          else if (matchesEventIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90"}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#delete-/v3/grants/-grant_id-/messages/-message_id-
          else if (matchesMessageIDPattern(requestEndpoint)) {
            res.setBody(
              '{"request_id": "5967ca40-a2d8-4ee0-a0e0-6f18ace39a90"}'
            );
            res.setStatusCode(200);
          }
          // https://developer.nylas.com/docs/api/v3/ecc/#delete-/v3/grants/-grant_id-/messages/schedules/-scheduleId-
          else if (matchesScheduledMessageIDPattern(requestEndpoint)) {
            res.setBody(
              '{ "Succesfully Request Schedule Deletion": { "value": { "request_id": "9c2ce8cd-d6e0-4206-a1d0-703f16880061", "data": { "message": "requested cancelation for workflow" }}}}'
            );
            res.setStatusCode(202);
          }
        }
        when 'PATCH' {
        }
      }
      return res;
    }

    // HELPER METHODS for matching endpoint patterns
    private Boolean matchesReturnAllCalendarsPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/calendars$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesCalendarIDPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/calendars/[a-zA-Z0-9-]+$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesEventGrantPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/events$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesEventIDPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/events/[a-zA-Z0-9-]+$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesEventRSVPPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/events/[a-zA-Z0-9-]+/send-rsvp$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesMessageGrantPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/messages$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesMessageIDPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/messages/[a-zA-Z0-9-]+$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesCleanEmailMessages(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/messages/[a-zA-Z0-9-]+/clean$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesSendMessage(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/messages/[a-zA-Z0-9-]+/send$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesScheduledMessageGrantPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/messages/schedules$';

      return nylasMock.compileMatchRegex(pattern, url);
    }

    private Boolean matchesScheduledMessageIDPattern(String url) {
      // Define the regular expression pattern
      String pattern = '^/v3/grants/[a-zA-Z0-9-]+/messages/schedules/[a-zA-Z0-9-]+$';

      return nylasMock.compileMatchRegex(pattern, url);
    }
  }

  // PRIVATE HELPER METHODS for repetitive code
  public String extractRequestEndpoint(HttpRequest req) {
    return req.getEndpoint().replace(this.baseURL, '').split('\\?')[0];
  }

  public Boolean compileMatchRegex(String pattern, String url) {
    // Use the Pattern and Matcher classes to check if the URL matches the pattern
    System.Pattern regexPattern = System.Pattern.compile(pattern);
    System.Matcher matcher = regexPattern.matcher(url);

    return matcher.matches();
  }
}
