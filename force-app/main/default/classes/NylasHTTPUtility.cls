public class NylasHTTPUtility {
  private static Nylas_V3_Setting__mdt nylasSettings = NylasConfig.getNylasConfig()
    .nylasSettings;

  // the base url for the Nylas API ('https://api.us.nylas.com' or 'https://api.eu.nylas.com')
  private static String baseURL = nylasSettings.Region__c == 'US' ||
  nylasSettings.Region__c == null
  ? 'https://api.us.nylas.com'
  : 'https://api.eu.nylas.com';

  private static String nylasAPISecret = nylasSettings.Nylas_API_Secret__c;

  // Enum for HTTP methods
  public enum HttpMethod {
    GET,
    POST,
    PUT,
    DEL,
    PATCH,
    HEAD,
    OPTIONS
  }

  public static HttpRequest newRequest(HttpMethod method, String url) {
    // Define the endpoint URL
    String endpointUrl = baseURL + url;
    String versionNumber = PackageVersion.VERSION_NUMBER;

    // Make post request to the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpointUrl);
    req.setMethod(method == HttpMethod.DEL ? 'DELETE' : method.name());
    req.setHeader('Content-Type', 'application/json');
    req.setHeader('Authorization', 'Bearer ' + nylasAPISecret);
    req.setHeader('User-Agent', 'Nylas-SFDC-SDK v' + versionNumber);

    return req;
  }

  public static HttpRequest newRequest(
    HttpMethod method,
    String url,
    String customAuthToken
  ) {
    // Define the endpoint URL
    String endpointUrl = baseURL + url;

    // Make post request to the endpoint
    HttpRequest req = new HttpRequest();
    req.setEndpoint(endpointUrl);
    req.setMethod(method == HttpMethod.DEL ? 'DELETE' : method.name());
    req.setHeader('Content-Type', 'application/json');
    req.setHeader('Authorization', 'Bearer ' + customAuthToken);
    req.setHeader('User-Agent', 'Nylas-SFDC-SDK-version');

    return req;
  }
}
