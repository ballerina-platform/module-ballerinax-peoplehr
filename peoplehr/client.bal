// Copyright (c) 2021, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerinax/'client.config;

# This connector helps you easily integrate People with other systems and applications, for seamless cross-platform data sharing. The People API 
# accepts and returns JSON data in the request body, with status indicating the outcome of the operation (sucess/failure).
#
# + HTTPClient - People HTTP Client
@display {label: "PeopleHR", iconPath: "icon.png"}
public isolated client class Client {
    final http:Client HTTPClient;
    final readonly & ConnectionConfig config;

    # Gets invoked to initialize the `connector`.
    # The connector initialization requires setting the API credentials. 
    # Follow [this guide](https://apidocs.peoplehr.com/#section/Authentication) to obtain token for PeopleHR connector.
    #
    # + config - People connection configuration
    # + httpClientConfig - HTTP configuration
    # + return - `http:Error` in case of failure to initialize or `null` if successfully initialized 
    public isolated function init(ConnectionConfig config) returns error? {
        self.config = config.cloneReadOnly();
        http:ClientConfiguration httpClientConfig = check config:constructHTTPClientConfig(config);
        self.HTTPClient = check new (config.baseURL, httpClientConfig);
    }

    # Creates new employee
    #
    # + payload - Request details on an new employee
    # + return - Successful response or an error
    @display{label: "Create New Employee"}
    isolated remote function createNewEmployee(@display{label: "Employee Detail"} NewEmployeeRequest|json payload)
                                               returns OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "CreateNewEmployee"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication)); 
        return self.HTTPClient->post(EMPLOYEE, request);
    }

    # Gets employee detail by id
    #
    # + payload - Request details on an employee
    # + return - Successful response or an error
    @display{label: "Get Employee Detail By Id"}
    isolated remote function getEmployeeById(@display{label: "Employee Request Detail"} EmployeeRequest 
                                                    payload) returns EmployeeResponse|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "GetEmployeeDetailById"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication)); 
        return self.HTTPClient->post(EMPLOYEE, request, targetType = EmployeeResponse);
    }

    # Updates employee id.
    #
    # + payload - Request details on an employee
    # + return - Successful response or an error
    @display{label: "Update EmployeeId"}   
    isolated remote function updateEmployeeId(@display{label: "Request Detail"}EmployeeIdUpdateRequest payload) returns  
                                              OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  { APIKey: self.config.apiKey, Action: "UpdateEmployeeId"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication)); 
        return self.HTTPClient->post(EMPLOYEE, request);
    }

    # Gets all employees.
    #
    # + payload - Request details on all employees
    # + return - Successful response or an error
    @display{label: "Get All Employee Detail"}
    isolated remote function getAllEmployees(@display{label: "Request Detail"}AllEmployeesRequest payload) 
                                                 returns EmployeesResponse|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "GetAllEmployeeDetail"}; 
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return self.HTTPClient->post(EMPLOYEE, request, targetType = EmployeesResponse);
    }

    # Updates employee details.
    #
    # + payload - Request details on an employee
    # + return - Successful response or an error
    @display{label: "Update Employee"}   
    isolated remote function updateEmployee(@display{label: "Employee Detail"} EmployeeUpdateRequest|json payload) 
                                                  returns OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "UpdateEmployeeDetail"}; 
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return self.HTTPClient->post(EMPLOYEE, request);
    }

    # Updates/marks employee leaver status by id.
    #
    # + payload - Request details on an employee
    # + return - Successful response or an error
    @display{label: "Mark As Leaver By Id"}  
    isolated remote function markAsLeaverById(@display{label: "Employee Detail"} EmployeeLeaverStatus payload) returns 
                                              OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "MarkAsLeaverById"}; 
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return self.HTTPClient->post(EMPLOYEE, request);
    }

    # Gets employee salary details.
    #
    # + payload - Request detail on salary
    # + return - Successful response or an error
    @display{label: "Get Salary Detail"}
    isolated remote function getSalaryDetail(@display{label: "Request Detail"} SalaryDetailRequest payload) returns 
                                            SalaryDetailGetResponse|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "GetSalaryDetail"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return self.HTTPClient->post(SALARY, request, targetType = SalaryDetailGetResponse);      
    }

    # Add new holiday.
    #
    # + payload - Request detail on new holiday
    # + return - Successful response or an error
    @display{label: "Add New Holiday"}
    isolated remote function addNewHoliday(@display{label: "Holiday Detail"} NewHolidayRequest|json payload) returns 
                                            OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "AddNewHoliday"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication)); 
        return self.HTTPClient->post(HOLIDAY, request);       
    }

    # Gets holiday detail list
    #
    # + payload - Request detail on a holiday
    # + return - Successful response or an error
    @display{label: "Get Holiday Detail"}
    isolated remote function getHolidayDetail(@display{label: "Holiday Detail"} HolidayDetail payload) returns 
                                              HolidayGetResponse|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "GetHolidayDetail"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication)); 
        return self.HTTPClient->post(HOLIDAY, request, targetType = HolidayGetResponse);      
    }

    # Deletes holiday detail
    #
    # + payload - Request detail on a holiday
    # + return - Successful response or an error
    @display{label: "Delete Holiday"}
    isolated remote function deleteHoliday(@display{label: "Holiday Detail"} HolidayDetail payload) returns 
                                            OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication =  {APIKey: self.config.apiKey, Action: "DeleteHoliday"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication)); 
        return self.HTTPClient->post(HOLIDAY, request);      
    }

    # Create new vacancy
    #
    # + payload - Request detail on new vacancy
    # + return - Successful response or an error 
    @display{label: "Add new Vacancies"}
    isolated remote function createNewVacancy(@display{label: "New vacancy detail"} NewVacancy payload) returns 
                                              OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication = {APIKey: self.config.apiKey, Action: "CreateNewVacancy"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return check self.HTTPClient->post(VACANCY, request);
    }

    # Gets vacancy detail
    #
    # + payload - Request detail on a vacancy 
    # + return - Successful response or an error
    @display{label: "Get Vacancy"}
    isolated remote function getVacancy(@display{label: "Request Detail"} GetVacancyResultRequest|json payload) returns 
                                        VacancyGetResponse|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication = {APIKey: self.config.apiKey, Action: "GetVacancy"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return check self.HTTPClient->post(VACANCY, request);
    }

    # Gets all vacancy detail
    #
    # + return - Successful response or an error
    @display{label: "Get Vacancies"}
    isolated remote function getAllVacancies() returns AllVacancies|error {
        http:Request request = new;
        json authentication = {APIKey: self.config.apiKey, Action: "GetAllVacancies"};
        request.setJsonPayload(authentication);
        return check self.HTTPClient->post(VACANCY, request);
    }

    # Creates New Applicant
    #
    # + payload - New applicant detail
    # + return - Successful response or an error
    @display{label: "Create New Applicant"}
    isolated remote function createNewApplicant(@display{label: "New Applicant detail"} NewApplicant payload) returns 
                                                OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication = {APIKey: self.config.apiKey, Action: "CreateNewApplicant"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return check self.HTTPClient->post(APPLICANT, request);
    }

    # Upload applicant document
    #
    # + payload - Request detail on new document
    # + return - Successful response or an error 
    @display{label: "Upload new applicant document"}
    isolated remote function uploadApplicantDocument(@display{label: "New applicant document"} NewDocument payload) 
                                                    returns OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication = {APIKey: self.config.apiKey, Action: "uploadapplicantdocument"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return check self.HTTPClient->post(APPLICANT, request);
    }

    # Checks duplicate applicant
    #
    # + payload - Request detail on an applicant
    # + return - Successful response or an error 
    @display{label: "Check duplicate applicant"}
    isolated remote function checkDuplicateApplicant(@display{label: "Applicant detail"} ApplicantInformation payload) 
                                                    returns OperationStatus|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication = {APIKey: self.config.apiKey, Action: "CheckDuplicateApplicant"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return check self.HTTPClient->post(APPLICANT, request);
    }

    # Gets query result By query name details.
    #
    # + payload - Request detail on a query 
    # + return - Successful response or an error
    @display{label: "Get Query Result By Query Name"}
    isolated remote function getQueryByName(@display{label: "Request Detail on Query Result"} 
                                            QueryResultGetRequest payload) returns QueryDetail|error {
        string path = string `/Query`;
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication = {APIKey: self.config.apiKey, Action: "GetQueryResultByQueryName"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return check self.HTTPClient->post(path, request);
    }

    # Checks if credentials of a given login user is valid.
    #
    # + payload - Request details on authentication
    # + return -  Successful response or an error
    @display{label: "Check Authentication"} 
    isolated remote function checkAuthentication(@display{label: "Authentication Detail"} AuthenticationInfo payload) 
                                                returns AuthenticationResponse|error {
        http:Request request = new;
        json jsonBody = check payload.cloneWithType(json);
        json authentication = {APIKey: self.config.apiKey, Action: "CheckAuthentication"};
        request.setJsonPayload(check jsonBody.mergeJson(authentication));
        return self.HTTPClient->post(EMPLOYEE, request);
    }
}
