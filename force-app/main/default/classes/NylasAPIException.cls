/**
 * @description       : Nylas API V3 custom exception class
 * @author            : Lincoln Rychecky
 * @last modified on  : 07-17-2024
 * @last modified by  : Lincoln Rychecky
 **/
public class NylasAPIException extends Exception {
  private String error;
  private String errorDescription;
  private String errorUri;
  private Integer errorCode;

  // Constructor to set the error details
  public NylasAPIException(
    String error,
    String errorDescription,
    String errorUri,
    Integer errorCode
  ) {
    String customMessage =
      'Error: ' +
      error +
      '\n' +
      'Description: ' +
      errorDescription +
      '\n' +
      'URI: ' +
      errorUri +
      '\n' +
      'Code: ' +
      errorCode;

    // this.message = customMessage;
    this.error = error;
    this.errorDescription = errorDescription;
    this.errorUri = errorUri;
    this.errorCode = errorCode;
  }

  // Override getMessage to include detailed error information
  public override String getMessage() {
    return this.errorDescription;
  }

  // Getters for each property, in case they need to be accessed individually
  public String getError() {
    return error;
  }

  public String getErrorDescription() {
    return errorDescription;
  }

  public String getErrorUri() {
    return errorUri;
  }

  public Integer getErrorCode() {
    return errorCode;
  }

  public static void throwNylasAPIExceptionFromResponse(String responseBody) {
    Map<String, Object> errorResponse = (Map<String, Object>) JSON.deserializeUntyped(
      responseBody
    );

    String error = (String) errorResponse.get('error');
    String errorDescription = (String) errorResponse.get('error_description');
    String errorUri = (String) errorResponse.get('error_uri');
    Integer errorCode = (Integer) errorResponse.get('error_code');

    throw new NylasAPIException(error, errorDescription, errorUri, errorCode);
  }
}
