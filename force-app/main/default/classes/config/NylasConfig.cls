/**
 * @description       : Singleton class for managing Nylas V3 SDK custom metadata configuration
 * @author            : Lincoln Rychecky
 * @group             :
 * @last modified on  : 07-03-2024
 * @last modified by  : Lincoln Rychecky
 **/

public with sharing class NylasConfig {
  private static NylasConfig instance = null;
  public Nylas_V3_Setting__mdt nylasSettings;
  private final String SETTING_NAME = 'System_Config'; // the default nylas setting custom metadata instance that is installed with the package

  private NylasConfig() {
    // if testing, we need to set the nylasSettings manually to placeholder values
    if (Test.isRunningTest()) {
      nylasSettings = new Nylas_V3_Setting__mdt(
        DeveloperName = 'System_Config',
        Callback_URI__c = 'placeholder',
        Client_ID__c = 'placeholder',
        Nylas_API_Secret__c = 'placeholder',
        Region__c = 'US'
      );
    } else {
      Nylas_V3_Setting__mdt nylasSettings = Nylas_V3_Setting__mdt.getInstance(
        SETTING_NAME
      );

      if (nylasSettings != null) {
        this.nylasSettings = nylasSettings;
      }
    }
  }

  public static NylasConfig getNylasConfig() {
    if (instance == null) {
      instance = new NylasConfig();
    }
    return instance;
  }
}
