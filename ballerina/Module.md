## Overview
PeopleHR connector provides the capability to access the operation to manage employee details, holidays and salaries etc.
 
This module supports 3.1 version.
 
## Prerequisites
 
Before using this connector in your Ballerina application, complete the following:
 
* Create [PeopleHR account](https://www.peoplehr.com/)
* Obtain tokens by following [this guide](https://apidocs.peoplehr.com/#section/Authentication)
 
## Quickstart
 
To use the people connector in your Ballerina application, update the .bal file as follows:
Add steps to create a simple sample
   ### Step 1 - Import connector

```ballerina
        import ballerinax/peoplehr;
```

   ### Step 2 - Create a new connector instance
```ballerina
        peoplehr:Client baseClient = check new ({apiKey: <API Key>, baseURL: "https://api.peoplehr.net"});
```
   ### Step 3 - Invoke  connector operation 
```ballerina
        peoplehr:QueryDetail response = check baseClient->getQueryByName({QueryName: <Query Name>});
```
Use `bal run` command to compile and run the Ballerina program. 
