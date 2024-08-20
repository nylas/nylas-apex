# Nylas SDK for Apex

This is the GitHub repository for the Nylas SDK for Apex. This repo is primarily for anyone who wants to make contributions to the SDK or install it from source.

## ⚙️ Install

[Package Installation Link](https://login.salesforce.com/packaging/installPackage.apexp?p0=04tQk000000JISfIAO)

## ⚡️Usage

To use this SDK, you must first [get a free Nylas account](https://dashboard-v3.nylas.com/login).

Then, follow the Quickstart guide to [set up your first app and get your API keys](https://developer.nylas.com/docs/v3-beta/v3-quickstart/).

For code examples that demonstrate how to use this SDK, take a look at our [Java repos in the Nylas Samples collection](https://github.com/orgs/nylas-samples/repositories?q=&type=all&language=java).

### 🚀 Making Your First Request

You use the `NylasAPIV3Client` and `NylasAPIV3AdminClient`classes to make requests to the Nylas API via a number of provided static methods. The SDK is organized around these two separate classes, each of which has methods to make requests to the [Nylas Admin](https://developer.nylas.com/docs/api/v3/admin/) or [Email, Calendar, Contacts CRUD Endpoints](https://developer.nylas.com/docs/api/v3/ecc/). Each resource is available through the `NylasAPIV3Client` or `NylasAPIV3AdminClient` objects configured with your API key.

First, navigate to Setup > Custom Metadata Types > Nylas V3 Setting > Manage Nylas V3 Settings > System_Config. This is where your API configuration is stored for all API callouts made via the SDK.

Configure the following values in the default custom metadata instance installed by the Nylas SDK with the label, System_Config .

- Callback URI
- Client ID
- Nylas API Secret
- Region (EU or US)

By following the [quickstart guide](https://developer.nylas.com/docs/v3-beta/v3-quickstart/) you will be able to obtain all of these values.

After setting your configuration in the System_Config custom metadata instance. To get a list of messages, you can use the following code:

```java
NylasAPIV3Client.ReturnAllMessagesParams params = new NylasAPIV3Client.ReturnAllMessagesParams();
params.messageLimit = 20;
params.to = 'lincoln.r@nylas.com';
params.inFolder = 'inbox';

ReturnAllMessagesResponse response = NylasAPIV3Client.returnAllMessages('grant-id', params);
```

## 📚 Documentation

Work in progress as the Nylas Apex language SDK was just released August 19, 2024
