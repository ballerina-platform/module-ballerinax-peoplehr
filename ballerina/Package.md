## Overview

[PeopleHR](https://www.peoplehr.com/) is a comprehensive HR software designed to help businesses manage their workforce efficiently. it provides tools for tracking employee information, managing leave and attendance, processing payroll, and monitoring performance.

The PeopleHR connector offers APIs to connect and interact with the PeopleHR REST API, enabling the programmatic management of employee details, holidays, salaries, and other HR-related resources.

### Key Features

- Manage employee records and information
- Efficient handling of holiday and leave requests
- Programmatic access to salary and payroll data
- Support for PeopleHR API version 3.1

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
