/**
 * @description       : Apex Client for Nylas API V3 Admin Endpoints
 * @author            : Lincoln Rychecky
 * @last modified on  : 08-16-2024
 * @last modified by  : Lincoln Rychecky
 **/
public class NylasAPIV3AdminClient {
  private static Nylas_V3_Setting__mdt nylasSettings = NylasConfig.getNylasConfig()
    .nylasSettings;

  // the base url for the Nylas API ('https://api.us.nylas.com' or 'https://api.eu.nylas.com')
  private static String baseURL = nylasSettings.Region__c == 'US' ||
    nylasSettings.Region__c == null
    ? 'https://api.us.nylas.com'
    : 'https://api.eu.nylas.com';

  // Define the endpoint URL
  private static String clientId = nylasSettings.Client_ID__c;
  private static String redirectURI = nylasSettings.Callback_URI__c;
  private static String nylasAPISecret = nylasSettings.Nylas_API_Secret__c;

  // APPLICATION ENDPOINTS (https://developer.nylas.com/docs/api/v3/admin/#tag--Applications)
  public static void getApplication() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getApplication is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updateApplication() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updateApplication is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void getApplicationCallbackURIs() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getApplicationCallbackURIs is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void addApplicationCallbackURI() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'addApplicationCallbackURI is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void getCallbackURI() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getCallbackURI is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void deleteCallbackURI() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'deleteCallbackURI is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updateCallbackURI() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updateCallbackURI is not currently implemented by the Nylas Apex SDK'
    );
  }

  // CONNECTOR ENDPOINTS https://developer.nylas.com/docs/api/v3/admin/#tag--Connectors-(Integrations))
  public static void listConnectors() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'listConnectors is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void createConnector() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'createConnector is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void getConnector() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getConnector is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void deleteConnector() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'deleteConnector is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updateConnector() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updateConnector is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void detectProvider() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'detectProvider is not currently implemented by the Nylas Apex SDK'
    );
  }

  // AUTHENTICATION API ENDPOINTS (https://developer.nylas.com/docs/api/v3/admin/#tag--Authentication-APIs)
  /**
   * Constructs the URL for the Nylas hosted authentication endpoint with optional query parameters.
   *
   * This method dynamically constructs a URL for initiating OAuth authentication with Nylas,
   * allowing for various optional parameters to be included in the request. These parameters
   * are used to customize the authentication flow, such as specifying the provider, scope,
   * and other OAuth-specific options.
   *
   * @param provider The authentication provider (e.g., Google, Microsoft). This is an enum value.
   * @param scope The scope of the access request, which specifies the Nylas features that the
   *              application intends to use.
   * @param prompt An enum value that specifies whether the Nylas authentication page should
   *               prompt the user for re-authentication and consent.
   * @param state An opaque value used by the client to maintain state between the request and
   *              callback, mitigating CSRF attacks.
   * @param login_hint A hint to the Nylas authentication server about the login identifier
   *                   the user might use.
   * @param access_type Specifies the type of access requested. This can be 'online' or 'offline'.
   * @param code_challenge Used in PKCE flow to provide proof of possession of the code verifier
   *                       when exchanging the authorization code for an access token.
   * @param code_challenge_method Method used to derive the code challenge. This is part of the
   *                              PKCE flow.
   * @param credential_id An optional parameter that specifies a credential to be used for
   *                      authentication.
   *
   * @return A string representing the fully constructed URL to the Nylas hosted authentication
   *         endpoint, including any specified query parameters.
   *
   * For more information, please refer to the Nylas Authentication documentation at:
   * https://developer.nylas.com/docs/api/v3/admin/#get-/v3/connect/auth
   */

  public class GetHostedAuthEndpointParams {
    public String provider;
    public String scope;
    public String prompt;
    public String state;
    public String login_hint;
    public String access_type;
    public String code_challenge;
    public String code_challenge_method;
    public String credential_id;
  }

  public static String getHostedAuthEndpoint(
    GetHostedAuthEndpointParams params
  ) {
    // Define the endpoint URL
    String endpointUrl =
      baseURL +
      '/v3/connect/auth?client_id=' +
      clientId +
      '&redirect_uri=' +
      redirectURI +
      '&response_type=code';

    // Add optional parameters if they are not null
    if (params.provider != '') {
      endpointUrl +=
        '&provider=' + EncodingUtil.urlEncode(params.provider, 'UTF-8');
    }
    if (params.scope != '') {
      endpointUrl += '&scope=' + EncodingUtil.urlEncode(params.scope, 'UTF-8');
    }
    if (params.prompt != '') {
      endpointUrl +=
        '&prompt=' + EncodingUtil.urlEncode(params.prompt, 'UTF-8');
    }
    if (params.state != '') {
      endpointUrl += '&state=' + EncodingUtil.urlEncode(params.state, 'UTF-8');
    }
    if (params.login_hint != '') {
      endpointUrl +=
        '&login_hint=' + EncodingUtil.urlEncode(params.login_hint, 'UTF-8');
    }
    if (params.access_type != '') {
      endpointUrl +=
        '&access_type=' + EncodingUtil.urlEncode(params.access_type, 'UTF-8');
    }
    if (params.code_challenge != '') {
      endpointUrl +=
        '&code_challenge=' +
        EncodingUtil.urlEncode(params.code_challenge, 'UTF-8');
    }
    if (params.code_challenge_method != '') {
      endpointUrl +=
        '&code_challenge_method=' +
        EncodingUtil.urlEncode(params.code_challenge_method, 'UTF-8');
    }
    if (params.credential_id != '') {
      endpointUrl +=
        '&credential_id=' +
        EncodingUtil.urlEncode(params.credential_id, 'UTF-8');
    }

    return endpointUrl;
  }

  /**
   * Exchanges an authorization code or refresh token for an access token with the Nylas API.
   *
   * This method supports two grant types: authorization code and refresh token. Depending on the
   * grant type specified, it either exchanges an authorization code for an access token (and
   * potentially a refresh token) or uses a refresh token to obtain a new access token. This is
   * part of the OAuth 2.0 flow. An optional parameter can be provided for PKCE (Proof Key for
   * Code Exchange) support when using the authorization code grant type.
   *
   * @param code The authorization code received from the OAuth provider or the refresh token
   *             depending on the grant type.
   * @param grantType The type of grant being requested, either AUTHORIZATION_CODE or REFRESH_TOKEN.
   * @param optionalParam An optional parameter for the PKCE code_verifier if using the
   *                      authorization code grant type. This parameter is ignored for refresh
   *                      token grant type.
   *
   * @return TokenExchangeResponse An object containing the access token, refresh token (if
   *         applicable), and other token-related information.
   *
   * @throws NylasAPIException If the Nylas API returns an error response, a `NylasAPIException` is thrown with
   * the error message from the API.
   *
   * Note: This method constructs a POST request to the Nylas token exchange endpoint, serializes
   * the request parameters into JSON format, and parses the JSON response into a
   * TokenExchangeResponse object.
   *
   * For more information, please refer to the Nylas Token Exchange documentation at:
   * https://developer.nylas.com/docs/api/v3/admin/#post-/v3/connect/token
   */
  public static TokenExchangeResponse tokenExchange(
    String code,
    String grantType,
    String optionalCodeVerifier
  ) {
    // Define the endpoint URL
    String url = '/v3/connect/token';

    // Make post request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.POST,
      url
    );

    // Build the request body based on the operation type
    Map<String, String> requestBody = new Map<String, String>{
      'client_id' => clientId,
      'client_secret' => nylasAPISecret,
      'redirect_uri' => redirectURI
    };

    if (grantType == 'authorization_code') {
      requestBody.put('grant_type', 'authorization_code');
      requestBody.put('code', code);
      if (optionalCodeVerifier != null && optionalCodeVerifier != '') {
        requestBody.put('code_verifier', optionalCodeVerifier); // Optional for PKCE
      }
    } else if (grantType == 'refresh_token') {
      requestBody.put('grant_type', 'refresh_token');
      requestBody.put('refresh_token', code); // Here, 'code' is actually the refresh token
    }

    // serialize the map into a JSON string
    req.setBody(JSON.serialize(requestBody));

    // send the request
    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      System.debug(res.getBody());

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }
      TokenExchangeResponse response = TokenExchangeResponse.parse(
        res.getBody()
      );
      return response;
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  /**
   * Revokes a given access token using the Nylas API.
   *
   * This method constructs and sends a POST request to the Nylas API's token revocation endpoint.
   * It is designed to revoke a specific access token, rendering it no longer valid for use in
   * subsequent API requests. The method does not return any value, but the successful execution
   * of the request indicates that the token has been revoked.
   *
   * @param tokenString The access token to be revoked.
   *
   * @throws NylasAPIException If the Nylas API returns an error response, a `NylasAPIException` is thrown with
   * the error message from the API.
   *
   * Note: It is important to handle any exceptions or errors that may arise during the HTTP
   * request to ensure the application can gracefully manage failed revocation attempts.
   *
   * For more information, please refer to the Nylas Token Revocation documentation at:
   * https://developer.nylas.com/docs/api/v3/admin/#post-/v3/connect/revoke
   */
  public static void revokeToken(String tokenString) {
    // Define the endpoint URL
    String url = '/v3/connect/revoke?token=' + tokenString;

    // Make post request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.POST,
      url
    );

    // send the request
    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  /**
   * Retrieves information about a given access token using the Nylas API.
   *
   * This method constructs and sends a GET request to the Nylas API's token information endpoint.
   * It is designed to retrieve detailed information about a specific access token, including the
   * token's issuer, audience, subject, expiration time, and other relevant details. The method
   * returns a TokenInfoResponse object containing the token information.
   *
   * @param idToken The ID token associated with the access token.
   * @param accessToken The access token for which to retrieve information.
   *
   * @return TokenInfoResponse An object containing detailed information about the access token.
   *
   * @throws NylasAPIException If the Nylas API returns an error response, a `NylasAPIException` is thrown with
   * the error message from the API.
   * Note: This method serializes the request parameters into JSON format, sends the GET request
   * to the Nylas API, and parses the JSON response into a TokenInfoResponse object.
   *
   * For more information, please refer to the Nylas Token Information documentation at:
   * https://developer.nylas.com/docs/api/v3/admin/#get-/v3/connect/tokeninfo
   */
  public static TokenInfoResponse tokenInfo(
    String idToken,
    String accessToken
  ) {
    // Define the endpoint URL
    String url = '/v3/connect/tokeninfo';

    // Make get request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url
    );

    // Build the request body based on the operation type
    Map<String, String> requestBody = new Map<String, String>{
      'id_token' => idToken,
      'access_token' => accessToken
    };

    // serialize the map into a JSON string
    req.setBody(JSON.serialize(requestBody));

    // send the request
    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return TokenInfoResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  /**
   * Create a grant manually using a custom authentication flow.
   *
   * For more information, please refer to the Nylas Token Information documentation at:
   * https://developer.nylas.com/docs/api/v3/admin/#post-/v3/connect/custom
   */
  public static void customAuth() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'customAuth is not currently implemented by the Nylas Apex SDK'
    );
  }

  // GRANT ENDPOINTS (https://developer.nylas.com/docs/api/v3/admin/#tag--Manage-Grants)
  public static void grantCustomAuth() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'grantCustomAuth is not currently implemented by the Nylas Apex SDK'
    );
  }

  /**
   * Retrieves a list of grants based on the specified parameters.
   *
   * This method constructs a query to the Nylas API's `/v3/grants` endpoint, appending various query parameters
   * based on the non-null fields of the `ListGrantsParams` object passed to it. It then makes a GET request
   * to the Nylas API with these parameters to retrieve a list of grants. The response is parsed into a
   * `ListGrantsResponse` object before being returned.
   *
   * @param params The `ListGrantsParams` object containing the query parameters for the request. This includes
   *               fields like `grantLimit`, `offset`, `sortBy`, `orderBy`, `since`, `email`, `grantStatus`,
   *               `ip`, `provider`, `accountId`, and `accountIds`. Only non-null fields are included in the query.
   *
   * @return A `ListGrantsResponse` object containing the response from the Nylas API.
   *
   * @throws NylasAPIException If the Nylas API returns an error response, a `NylasAPIException` is thrown with
   * the error message from the API.
   *
   * For more information, please refer to the Nylas Authentication documentation at:
   * https://developer.nylas.com/docs/api/v3/admin/#get-/v3/grants
   */
  public class ListGrantsParams {
    public Integer grantLimit;
    public Integer offset;
    public String sortBy;
    public String orderBy;
    public Integer since;
    public String email;
    public String grantStatus;
    public String ip;
    public String provider;
    public String accountId;
    public String accountIds;
  }

  public static ListGrantsResponse listGrants(ListGrantsParams params) {
    String url = '/v3/grants';

    // Add the query parameters
    if (params.grantLimit != null) {
      url += '?limit=' + params.grantLimit;
    }

    // Add the query parameters
    if (params.offset != null) {
      url += '?offset=' + params.offset;
    }

    // Add the query parameters
    if (params.sortBy != null) {
      url += '?sort_by=' + params.sortBy;
    }

    // Add the query parameters
    if (params.orderBy != null) {
      url += '?order_by=' + params.orderBy;
    }

    // Add the query parameters
    if (params.since != null) {
      url += '?since=' + params.since;
    }

    // Add the query parameters
    if (params.email != null) {
      url += '?email=' + params.email;
    }

    // Add the query parameters
    if (params.grantStatus != null) {
      url += '?grant_status=' + params.grantStatus;
    }

    // Add the query parameters
    if (params.ip != null) {
      url += '?ip=' + params.ip;
    }

    // Add the query parameters
    if (params.provider != null) {
      url += '?provider=' + params.provider;
    }

    // Add the query parameters
    if (params.accountId != null) {
      url += '?account_id=' + params.accountId;
    }

    // Add the query parameters
    if (params.accountIds != null) {
      url += '?accountIds=' + params.accountIds;
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

      return ListGrantsResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static GetGrantResponse getGrant(String grantId) {
    String url = '/v3/grants/' + grantId;

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

      return GetGrantResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static DeleteGrantResponse deleteGrant(String grantId) {
    String url = '/v3/grants/' + grantId;

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

      return DeleteGrantResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static UpdateGrantResponse updateGrant(
    String grantId,
    Map<String, String> settings,
    List<String> scope
  ) {
    String url = '/v3/grants/' + grantId;

    // Make PATCH request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.PATCH,
      url
    );

    // Build the request body based on the operation type
    Map<String, Object> requestBody = new Map<String, Object>{
      'settings' => JSON.serialize(settings),
      'scope' => JSON.serialize(scope)
    };

    // serialize the map into a JSON string
    req.setBody(JSON.serialize(requestBody));

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return UpdateGrantResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static GetCurrentGrantResponse getCurrentGrant(
    String nylasUserAccessToken
  ) {
    String url = '/v3/grants/me';

    // Make GET request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.GET,
      url,
      nylasUserAccessToken
    );

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return GetCurrentGrantResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  // WEBHOOK NOTIFICATIONS ENDPOINTS (https://developer.nylas.com/docs/api/v3/admin/#tag--Webhook-Notifications)
  public static void getApplicationDestinations() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getApplicationDestinations is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void createWebookDestination() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'createApplicationDestination is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void getDestinationsByWebhookID() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getDestinationsByWebhookID is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updateWebhookDestination() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updateWebhookDestination is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void deleteWebhookDestination() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'deleteWebhookDestination is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void rotateWebhookSecret() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'rotateWebhookSecret is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void getMockNotificationPayloadWebhook() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getMockNotificationPayload is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void sendTestEvent() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'sendTestEvent is not currently implemented by the Nylas Apex SDK'
    );
  }

  // PUBSUB NOTIFICATION ENDPOINTS (https://developer.nylas.com/docs/api/v3/admin/#tag--PubSub-Notifications)
  public static void getMockNotificationPayloadPubsub() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getMockNotificationPayload is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void getApplicationPubsubChannels() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getApplicationPubsubChannels is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void createPubsubChannel() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'createPubsubChannel is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void getPubsubChannel() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'getPubsubChannel is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void updatePubsubChannel() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'updatePubsubChannel is not currently implemented by the Nylas Apex SDK'
    );
  }

  public static void deletePubsubChannel() {
    // TODO
    System.debug(
      LoggingLevel.WARN,
      'deletePubsubChannel is not currently implemented by the Nylas Apex SDK'
    );
  }

  // CONNECTOR CREDENTIAL ENDPOINTS (https://developer.nylas.com/docs/api/v3/admin/#tag--Connector-credentials)
  public class ListCredentialsParams {
    public Integer credentialLimit;
    public Integer offset;
    public String sortBy;
    public String orderBy;
  }

  public static ListCredentialsResponse listCredentials(
    String provider,
    ListCredentialsParams params
  ) {
    String url = '/v3/connectors/' + provider + '/creds';

    // Add the query parameters
    if (params.credentialLimit != null) {
      url += '?limit=' + params.credentialLimit;
    }

    // Add the query parameters
    if (params.offset != null) {
      url += '?offset=' + params.offset;
    }

    // Add the query parameters
    if (params.sortBy != null) {
      url += '?sort_by=' + params.sortBy;
    }

    // Add the query parameters
    if (params.orderBy != null) {
      url += '?order_by=' + params.orderBy;
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

      return ListCredentialsResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static CreateCredentialResponse createCredential(
    String name,
    String credentialType,
    String provider,
    Map<String, Object> credentialData
  ) {
    String url = '/v3/connectors/' + provider + '/creds';

    // Make post request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.POST,
      url
    );

    Map<String, String> requestBody = new Map<String, String>{
      'name' => name,
      'credential_type' => credentialType,
      'credential_data' => JSON.serialize(credentialData)
    };

    // serialize the map into a JSON string
    req.setBody(JSON.serialize(requestBody));

    // send the request
    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }
      CreateCredentialResponse response = CreateCredentialResponse.parse(
        res.getBody()
      );
      return response;
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static GetCredentialResponse getCredential(
    String provider,
    String id
  ) {
    String url = '/v3/connectors/' + provider + '/creds/' + id;

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

      return GetCredentialResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static DeleteCredentialResponse deleteCredential(
    String provider,
    String credentialID
  ) {
    String url = '/v3/connectors/' + provider + '/creds/' + credentialID;

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

      return DeleteCredentialResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }

  public static UpdateCredentialResponse updateCredential(
    String provider,
    String credentialID,
    String name,
    map<String, String> credentialData
  ) {
    String url = '/v3/connectors/' + provider + '/creds/' + credentialID;

    // Make PATCH request to the endpoint
    HttpRequest req = NylasHTTPUtility.newRequest(
      NylasHTTPUtility.HttpMethod.PATCH,
      url
    );

    Map<String, String> requestBody = new Map<String, String>{
      'name' => name,
      'credential_data' => JSON.serialize(credentialData)
    };

    // serialize the map into a JSON string
    req.setBody(JSON.serialize(requestBody));

    try {
      Http http = new Http();
      HTTPResponse res = http.send(req);

      if (res.getStatusCode() < 200 || res.getStatusCode() >= 300) {
        NylasAPIException.throwNylasAPIExceptionFromResponse(res.getBody());
      }

      return UpdateCredentialResponse.parse(res.getBody());
    } catch (NylasAPIException e) {
      System.debug(
        LoggingLevel.ERROR,
        'Nylas API Exception: ' + e.getMessage()
      );
      throw e;
    }
  }
}
