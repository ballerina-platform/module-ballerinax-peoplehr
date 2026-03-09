## Overview
PeopleHR connector provides the capability to access the operation to manage employee details, holidays and salaries etc.
 
This connector supports 3.1 version.
 
## Setup guide

- Create [PeopleHR account](https://www.peoplehr.com/)
- Obtain tokens by following [this guide](https://apidocs.peoplehr.com/#section/Authentication)

## Compatibility
|                      | Version                      |
|----------------------|------------------------------|
| Ballerina Language   | Ballerina Swan Lake 2201.3.1 |
| People HR API        | 3.1                          |
 
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
### Step 3 - Invoke connector operation 

```ballerina
        peoplehr:QueryDetail response = check baseClient->getQueryByName({QueryName: <Query Name>});
```
Use `bal run` command to compile and run the Ballerina program. 

## Report issues
To report bugs, request new features, start new discussions, view project boards, etc., go to the [Ballerina Extended Library repository](https://github.com/ballerina-platform/ballerina-extended-library)

## Useful links
- Discuss code changes of the Ballerina project in [ballerina-dev@googlegroups.com](mailto:ballerina-dev@googlegroups.com).
- Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
- Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag
