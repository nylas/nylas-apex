/**
 * @description       : Test class for NylasAPIV3AdminClient.cls
 * @author            : Lincoln Rychecky
 * @group             :
 * @last modified on  : 07-17-2024
 * @last modified by  : Lincoln Rychecky
 **/

@isTest
public class NylasAPIV3AdminClientTest {
  @isTest
  static void testGetApplication() {
    Test.startTest();
    NylasAPIV3AdminClient.getApplication();
    Test.stopTest();
  }

  @isTest
  static void testUpdateApplication() {
    Test.startTest();
    NylasAPIV3AdminClient.updateApplication();
    Test.stopTest();
  }

  @isTest
  static void testgetApplicationCallbackURIs() {
    Test.startTest();
    NylasAPIV3AdminClient.getApplicationCallbackURIs();
    Test.stopTest();
  }

  @isTest
  static void testaddApplicationCallbackURIs() {
    Test.startTest();
    NylasAPIV3AdminClient.addApplicationCallbackURI();
    Test.stopTest();
  }

  @isTest
  static void testgetCallbackURI() {
    Test.startTest();
    NylasAPIV3AdminClient.getCallbackURI();
    Test.stopTest();
  }

  @isTest
  static void testdeleteCallbackURI() {
    Test.startTest();
    NylasAPIV3AdminClient.deleteCallbackURI();
    Test.stopTest();
  }

  @isTest
  static void testupdateCallbackURI() {
    Test.startTest();
    NylasAPIV3AdminClient.updateCallbackURI();
    Test.stopTest();
  }

  @isTest
  static void testlistConnectors() {
    Test.startTest();
    NylasAPIV3AdminClient.listConnectors();
    Test.stopTest();
  }

  @isTest
  static void testcreateConnector() {
    Test.startTest();
    NylasAPIV3AdminClient.createConnector();
    Test.stopTest();
  }

  @isTest
  static void testgetConnector() {
    Test.startTest();
    NylasAPIV3AdminClient.getConnector();
    Test.stopTest();
  }

  @isTest
  static void testdeleteConnector() {
    Test.startTest();
    NylasAPIV3AdminClient.deleteConnector();
    Test.stopTest();
  }

  @isTest
  static void testupdateConnector() {
    Test.startTest();
    NylasAPIV3AdminClient.updateConnector();
    Test.stopTest();
  }

  @isTest
  static void testdetectProvider() {
    Test.startTest();
    NylasAPIV3AdminClient.detectProvider();
    Test.stopTest();
  }

  @isTest
  static void testgetHostedAuthEndpoint() {
    Test.startTest();
    NylasAPIV3AdminClient.GetHostedAuthEndpointParams params = new NylasAPIV3AdminClient.GetHostedAuthEndpointParams();
    params.provider = 'google';
    params.scope = 'test.scope';
    params.prompt = 'select_provider';
    params.state = 'state 1';
    params.login_hint = 'this is a hint';
    params.access_type = 'offline';
    params.code_challenge = 'e96bf6686a3c3510e9e927db7069cb1cba9b99b022f49483a6ce3270809e68a2';
    params.code_challenge_method = 'S256';
    params.credential_id = 'e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47';

    String hostedAuthEndpoint = NylasAPIV3AdminClient.getHostedAuthEndpoint(
      params
    );
    Test.stopTest();

    System.debug('hostedAuthEndpoint: ' + hostedAuthEndpoint);

    // Add assertions as needed
    System.assertEquals(
      'https://api.us.nylas.com/v3/connect/auth?client_id=2680bfe2-359a-405e-8483-d02afb8e6964&redirect_uri=https%3A%2F%2Fpower-efficiency-11572-dev-ed--nylas.scratch.vf.force.com%2Fapex%2FNylasAuth&response_type=code&provider=google&scope=test.scope&prompt=select_provider&state=state+1&login_hint=this+is+a+hint&access_type=offline&code_challenge=e96bf6686a3c3510e9e927db7069cb1cba9b99b022f49483a6ce3270809e68a2&code_challenge_method=S256&credential_id=e19f8e1a-eb1c-41c0-b6a6-d2e59daf7f47',
      hostedAuthEndpoint,
      'The hostedAuthEndpoint does not match the expected value.'
    );
  }

  @isTest
  static void testtokenExchange() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    Test.startTest();
    TokenExchangeResponse response = NylasAPIV3AdminClient.tokenExchange(
      'code',
      'authorization_code',
      'optional_code_verifier'
    );
    Test.stopTest();

    System.debug('TokenExchangeResponse: ' + response);

    System.assertEquals(
      '<NYLAS_ACCESS_TOKEN>',
      response.access_token,
      'response.access_token should equal <NYLAS_ACCESS_TOKEN>'
    );
    System.assertEquals(
      3600,
      response.expires_in,
      'response.expires_in should equal 3600'
    );
    System.assertEquals(
      '<JWT_TOKEN>',
      response.id_token,
      'response.id_token should equal <JWT_TOKEN>'
    );
    System.assertEquals(
      'example@gmail.com',
      response.email,
      'response.email should equal example@gmail.com'
    );
    System.assertEquals(
      '<REFRESH_TOKEN>',
      response.refresh_token,
      'response.<REFRESH_TOKEN> should equal <REFRESH_TOKEN>'
    );
    System.assertEquals(
      'https://www.googleapis.com/auth/gmail.readonly profile',
      response.scope,
      'response.scope should equal https://www.googleapis.com/auth/gmail.readonly profile'
    );
    System.assertEquals(
      'Bearer',
      response.token_type,
      'response.token_type should equal Bearer'
    );
    System.assertEquals(
      '<NYLAS_GRANT_ID>',
      response.grant_id,
      'response.grant_id should equal <NYLAS_GRANT_ID>'
    );
    System.assertEquals(
      'google',
      response.provider,
      'response.provider should equal google'
    );
  }

  @isTest
  static void testrevokeToken() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.revokeToken('<REFRESH_TOKEN>');
    test.stopTest();
  }

  @isTest
  static void testtokenInfo() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    TokenInfoResponse response = NylasAPIV3AdminClient.tokenInfo('123', '456');
    test.stopTest();

    System.debug('TokenInfoResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );
    System.assertEquals(
      'https://nylas.com',
      response.data.iss,
      'response.iss should equal https://nylas.com'
    );
    System.assertEquals(
      'http://localhost: 3030',
      response.data.aud,
      'response.aud should equal http://localhost: 3030'
    );
    System.assertEquals(
      'Jaf84d88-£274-46cc-bbc9-aed7dac061c7',
      response.data.sub,
      'response.sub should equal Jaf84d88-£274-46cc-bbc9-aed7dac061c7'
    );
    System.assertEquals(
      'user@example.com',
      response.data.email,
      'response.email should equal user@example.com'
    );
    System.assertEquals(
      1692094848,
      response.data.iat,
      'response.iat should equal 1692094848'
    );
    System.assertEquals(
      1692095173,
      response.data.exp,
      'response.exp should equal 1692095173'
    );
  }

  @isTest
  static void testcustomAuth() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.customAuth();
    test.stopTest();
  }

  @isTest
  static void testgrantCustomAuth() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.grantCustomAuth();
    test.stopTest();
  }

  @isTest
  static void testlistGrants() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();

    NylasAPIV3AdminClient.ListGrantsParams params = new NylasAPIV3AdminClient.ListGrantsParams();
    params.grantLimit = 10;
    params.offset = 0;
    params.sortBy = 'created_at';
    params.orderBy = 'desc';
    params.since = 1234;
    params.email = 'example@gmail.com';
    params.grantStatus = 'valid';
    params.ip = '127.0.0.1';
    params.provider = 'google';
    params.accountId = '123';
    params.accountIds = '123,456';

    ListGrantsResponse response = NylasAPIV3AdminClient.listGrants(params);
    test.stopTest();

    System.debug('ListGrantsResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );

    System.assert(
      response.grants.size() > 0,
      'response.grants should have a size greater than 0'
    );
  }

  @isTest
  static void testgetGrant() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    GetGrantResponse response = NylasAPIV3AdminClient.getGrant('testID');
    test.stopTest();

    System.debug('GetGrantResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testdeleteGrant() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    DeleteGrantResponse response = NylasAPIV3AdminClient.deleteGrant('testID');
    test.stopTest();

    System.debug('DeleteGrantResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );
  }

  @isTest
  static void testupdateGrant() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();

    Map<String, String> settings = new Map<String, String>();
    settings.put('refresh_token', 'adadada...');

    List<String> scopes = new List<String>();
    scopes.add('Mail.Read');
    scopes.add('User.Read');
    scopes.add('offline_access');

    UpdateGrantResponse response = NylasAPIV3AdminClient.updateGrant(
      'testID',
      settings,
      scopes
    );
    test.stopTest();

    System.debug('UpdateGrantResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testgetCurrentGrant() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    GetCurrentGrantResponse response = NylasAPIV3AdminClient.getCurrentGrant(
      'nylasAccessToken'
    );
    test.stopTest();

    System.debug('GetCurrentGrantResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testgetApplicationDestinations() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.getApplicationDestinations();
    test.stopTest();
  }

  @isTest
  static void testcreateWebookDestination() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.createWebookDestination();
    test.stopTest();
  }

  @isTest
  static void testgetDestinationsByWebhookID() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.getDestinationsByWebhookID();
    test.stopTest();
  }

  @isTest
  static void testupdateWebhookDestination() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.updateWebhookDestination();
    test.stopTest();
  }

  @isTest
  static void testdeleteWebhookDestination() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.deleteWebhookDestination();
    test.stopTest();
  }

  @isTest
  static void testrotateWebhookSecret() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.rotateWebhookSecret();
    test.stopTest();
  }

  @isTest
  static void testgetMockNotificationPayloadWebhook() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.getMockNotificationPayloadWebhook();
    test.stopTest();
  }

  @isTest
  static void testsendTestEvent() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.sendTestEvent();
    test.stopTest();
  }

  @isTest
  static void testgetMockNotificationPayloadPubsub() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.getMockNotificationPayloadPubsub();
    test.stopTest();
  }

  @isTest
  static void testgetApplicationPubsubChannels() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.getApplicationPubsubChannels();
    test.stopTest();
  }

  @isTest
  static void testcreatePubsubChannel() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.createPubsubChannel();
    test.stopTest();
  }

  @isTest
  static void testgetPubsubChannel() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.getPubsubChannel();
    test.stopTest();
  }

  @isTest
  static void testupdatePubsubChannel() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.updatePubsubChannel();
    test.stopTest();
  }

  @isTest
  static void testdeletePubsubChannel() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    NylasAPIV3AdminClient.deletePubsubChannel();
    test.stopTest();
  }

  @isTest
  static void testlistCredentials() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();

    NylasAPIV3AdminClient.ListCredentialsParams params = new NylasAPIV3AdminClient.ListCredentialsParams();
    params.credentialLimit = 10;
    params.offset = 0;
    params.sortBy = 'created_at';
    params.orderBy = 'desc';

    ListCredentialsResponse response = NylasAPIV3AdminClient.listCredentials(
      'google',
      params
    );
    test.stopTest();

    System.debug('ListCredentialsResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );

    System.assert(
      response.credentials.size() > 0,
      'response.credentials should have a size greater than 0'
    );
  }

  @isTest
  static void testcreateCredential() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    CreateCredentialResponse response = NylasAPIV3AdminClient.createCredential(
      'credential name',
      'serviceaccount',
      'google',
      NylasHTTPMock.testGoogleServiceAccount
    );
    test.stopTest();

    System.debug('CreateCredentialResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testgetCredential() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    GetCredentialResponse response = NylasAPIV3AdminClient.getCredential(
      'google',
      'credential-id'
    );
    test.stopTest();

    System.debug('GetCredentialResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }

  @isTest
  static void testdeleteCredential() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    DeleteCredentialResponse response = NylasAPIV3AdminClient.deleteCredential(
      'google',
      'credential-id'
    );
    test.stopTest();

    System.debug('DeleteCredentialResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );
  }

  @isTest
  static void testupdateCredential() {
    Test.setMock(
      HttpCalloutMock.class,
      new NylasHTTPMock.NylasAdminV3MockHTTP()
    );

    test.startTest();
    map<String, String> credentialData = new Map<String, String>();
    credentialData.put('type', 'service_account');
    credentialData.put('project_id', 'marketplace-sa-test');
    credentialData.put('private_key_id', 'abcd1234defg5678');

    UpdateCredentialResponse response = NylasAPIV3AdminClient.updateCredential(
      'google',
      'credential-id',
      'credential name',
      credentialData
    );
    test.stopTest();

    System.debug('UpdateCredentialResponse: ' + response);

    System.assertEquals(
      '5967ca40-a2d8-4ee0-a0e0-6f18ace39a90',
      response.request_id,
      'response.request_id should equal 5967ca40-a2d8-4ee0-a0e0-6f18ace39a90'
    );

    System.assert(response.data != null, 'response.data should not be null');
  }
}
