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

import ballerina/test;
import ballerina/os;
import ballerina/random;
import ballerina/log;

configurable string apiKey = os:getEnv("API_KEY");
configurable string baseURL = os:getEnv("BASE_URL");
configurable string emailAddress = os:getEnv("EMAIL_ADDRESS");
configurable string password = os:getEnv("PASSWORD");
configurable string queryName = os:getEnv("QUERY_NAME");
configurable int screenId = 380477;
configurable string employeeId = "test01";
configurable string user1 = "PW10";
configurable string user2 = "PW2";
configurable int applicantId = 7696154;

int txnId = 0;
int appraisalId = 0;

Client baseClient = check new ({apiKey: apiKey, baseURL: baseURL});

@test:Config {enable: true}
function checkAuthentication() returns error? {
    log:printInfo("Check Authentication");
    AuthenticationResponse response = check baseClient->checkAuthentication({
        EmailAddress: emailAddress,
        Password: password
    });
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true}
function testGetQueryResultByQueryName() returns error? {
    log:printInfo("Get Query Result By QueryName");
    QueryDetail response = check baseClient->getQueryByName({QueryName: queryName});
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {
    enable: true,
    dependsOn: [
        testGetEmployeeDetailById,
        testMarkAsLeaverById,
        testAddNewHoliday
    ]
}
function testUpdateEmployeeId() returns error? {
    log:printInfo("Update Employee Id");
    EmployeeIdUpdateRequest EmployeeIdUpdateRequest = {
        ReasonForChange: "Test only",
        OldEmployeeId: employeeId,
        NewEmployeeId: (check random:createIntInRange(100, 1000)).toString()
    };
    OperationStatus|error response = baseClient->updateEmployeeId(EmployeeIdUpdateRequest);
    if response is error {
        test:assertFail(response.message());
    }
}

@test:Config {enable: true}
function testGetAllEmployeeDetail() returns error? {
    log:printInfo("Get All Employee Detail");
    AllEmployeesRequest AllEmployeesRequest = {
        IncludeLeavers: false
    };
    EmployeesResponse response = check baseClient->getAllEmployees(AllEmployeesRequest);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testCreateNewEmployee]}
function testGetEmployeeDetailById() returns error? {
    log:printInfo("Get Employee Detail By Id");
    EmployeeRequest EmployeeRequest = {
        EmployeeId: user1
    };
    EmployeeResponse response = check baseClient->getEmployeeById(EmployeeRequest);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true}
function testCreateNewEmployee() returns error? {
    log:printInfo("Create New Employee");
    NewEmployeeRequest employee = {
        EmployeeId: user2,
        FirstName: "Ballerina Employee",
        LastName: "Ballerina Employee Last Name",
        StartDate: "2022-01-31",
        JobRole: "Software Engineer",
        JobRoleEffectiveDate: "2022-01-31",
        Location: "Colombo03",
        Department: "Engineering"
    };
    OperationStatus|error response = baseClient->createNewEmployee(employee);
    if response is error {
        test:assertFail(response.message());
    }
}

@test:Config {enable: true, dependsOn: [testCreateNewEmployee]}
function testUpdateEmployeeDetail() returns error? {
    log:printInfo("Update Employee Detail");
    EmployeeUpdateRequest employee = {
        EmployeeId: user2,
        FirstName: "BallerinaUser",
        ReasonForChange: "Test"
    };
    OperationStatus response = check baseClient->updateEmployee(employee);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testUpdateEmployeeDetail]}
function testMarkAsLeaverById() returns error? {
    log:printInfo("Mark As Leaver By Id");
    EmployeeLeaverStatus employeeLeaverStatus = {
        EmployeeId: user2,
        ReasonforLeaving: "test leaving",
        FinalEmploymentDate: "2023-12-02",
        FinalWorkingDate: "2023-12-02",
        MarkasLeaverImmediately: "false",
        ReEmployable: "No",
        AdditionalComments: "Test",
        SupportingComments: "supporting comments"
    };
    OperationStatus|error response = baseClient->markAsLeaverById(employeeLeaverStatus);
    if response is error {
        test:assertFail(response.message());
    }
}

@test:Config {enable: true}
function testGetSalaryDetail() returns error? {
    log:printInfo("Get Salary Detail");
    SalaryDetailRequest salaryDetailRequest = {
        EmployeeId: user2,
        IsIncludeHistory: false
    };
    SalaryDetailGetResponse response = check baseClient->getSalaryDetail(salaryDetailRequest);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testCreateNewEmployee]}
function testAddNewHoliday() returns error? {
    log:printInfo("Add New Holiday");
    NewHolidayRequest newHolidayRequest = {
        EmployeeId: user2,
        DurationType: "1",
        StartDate: "2023-07-27",
        EndDate: "2023-07-27",
        DurationInDays: "1",
        DurationInMinutes: "450"
    };
    OperationStatus|error response = baseClient->addNewHoliday(newHolidayRequest);
    if response is error {
        test:assertFail(response.message());
    }
}

@test:Config {enable: true, dependsOn: [testAddNewHoliday]}
function testGetHolidayDetail() returns error? {
    log:printInfo("Get Holiday Detail");
    HolidayDetail holidayDetail = {
        EmployeeId: user2
    };
    HolidayGetResponse response = check baseClient->getHolidayDetail(holidayDetail);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testGetHolidayDetail]}
function testDeleteHoliday() returns error? {
    log:printInfo("Delete Holiday");
    HolidayDetail holidayDetail = {
        EmployeeId: user2,
        StartDate: "2023-07-27",
        EndDate: "2023-07-27"
    };
    OperationStatus response = check baseClient->deleteHoliday(holidayDetail);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true}
function testGetVacancy() returns error? {
    log:printInfo("Get Vacancy");
    GetVacancyResultRequest vacancyDetail = {
        VacancyReference: "VA1"
    };
    VacancyGetResponse response = check baseClient->getVacancy(vacancyDetail);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true}
function testGetAllVacancies() returns error? {
    log:printInfo("Get All Vacancies");
    AllVacancies response = check baseClient->getAllVacancies();
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true}
function testCreateNewApplicant() returns error? {
    log:printInfo("Create new applicant");
    NewApplicant newApplicant = {
        FirstName: "Smith",
        LastName: "Perera",
        Email: "testapplicant@wso2.com",
        Documents: [{DocumentName: "CV01", Url: "www.mycv.com"}],
        Skills: "Programming",
        VacancyReference: "VA100"
    };
    OperationStatus|error response = baseClient->createNewApplicant(newApplicant);
    if response is error {
        test:assertFail(response.message());
    }
}

@test:Config {enable: true, dependsOn: [testCreateNewApplicant]}
function testUploadApplicantDocument() returns error? {
    log:printInfo("Upload new document");
    NewDocument newDocument = {
        ApplicantId: applicantId.toString(),
        Description: "Degree",
        DocumentName: "transcript.txt",
        File: "dGVzdCBmaWxlCg=="
    };
    OperationStatus response = check baseClient->uploadApplicantDocument(newDocument);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testCreateNewApplicant]}
function testCheckDuplicateApplicant() returns error? {
    log:printInfo("Check duplicate applicant");
    ApplicantInformation applicantInformation = {
        FirstName: "Smith",
        LastName: "Perera",
        Email: "testapplicant@wso2.com",
        VacancyReference: "VA3"
    };
    OperationStatus response = check baseClient->checkDuplicateApplicant(applicantInformation);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true}
function testGetEmployeeScreenDetail() returns error? {
    log:printInfo("Get employee screen detail");
    EmployeeScreenDetailResponse response = check baseClient->getEmployeeScreenDetail();
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testAddNewCustomScreenTransaction]}
function testGetEmployeeScreenDetailByEmployeeID() returns error? {
    log:printInfo("Get employee screen detail by employee ID");
    ScreenDetailByEmployeeIDRequest payload = {
        ScreenId: screenId,
        EmployeeId: user1
    };
    EmployeeScreenDetailResponse response = check baseClient->getEmployeeScreenDetailByEmployeeID(payload);
    EmployeeScreenDetail[] transcationId = check response.Result.ensureType();
    txnId = check transcationId[0]?.TxnId.ensureType();
    log:printInfo(txnId.toString());
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testGetEmployeeScreenDetailByEmployeeID]}
function testGetEmployeeScreenDetailByTransactionID() returns error? {
    log:printInfo("Get employee screen detail by transaction ID");
    ScreenDetailByTransactionIDRequest payload = {
        ScreenId: screenId,
        EmployeeId: user1,
        CustomScreenTransactionId: txnId
    };
    EmployeeScreenDetailResponse response = check baseClient->getEmployeeScreenDetailByEmployeeID(payload);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testGetEmployeeScreenDetail]}
function testAddNewCustomScreenTransaction() returns error? {
    log:printInfo("Add new employee screen detail");
    NewCustomScreenTransactionDetails payload = {
        EmployeeId: user1,
        ScreenId: screenId,
        CustomColumns: [
            {
                ColumnName: "Info",
                ColumnValue: "test log book info"
            }
        ],
        AddFiles: [
            {
                DocumentName: "123.pdf",
                File: "Pass base64 string",
                Description: "File description",
                DocumentCategory: "Custom Category",
                SignatureRequired: false
            }
        ]
    };
    OperationStatus response = check baseClient->addNewCustomScreenTransaction(payload);

    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testGetEmployeeScreenDetailByEmployeeID]}
function testUpdateCustomScreenTransaction() returns error? {
    log:printInfo("Update new employee screen detail");
    ExistingCustomScreenTransactionDetails payload = {
        CustomScreenTransactionId: txnId,
        EmployeeId: user1,
        ScreenId: screenId,
        CustomColumns: [
            {
                ColumnName: "Info",
                ColumnValue: "test update"
            }
        ],
        AddFiles: []
    };
    OperationStatus response = check baseClient->updateCustomScreenTransaction(payload);

    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testUpdateCustomScreenTransaction]}
function testDeleteEmployeeScreenDetailByTransactionID() returns error? {
    log:printInfo("Delete employee screen detail by employee ID");
    ScreenDetailByTransactionIDRequest payload = {
        ScreenId: screenId,
        EmployeeId: user1,
        CustomScreenTransactionId: txnId
    };
    OperationStatus response = check baseClient->DeleteCustomScreenTransaction(payload);
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true}
function testGetAppraisalDetailsByEmployeeID() returns error? {
    log:printInfo("Get appraisal details by employee ID");
    AppraisalDetailsRequest payload = {
        EmployeeId: user1,
        StartDate: "2021-11-02",
        EndDate: "2023-11-21"
    };
    AppraisalDetailsResponse response = check baseClient->getAppraisalDetailsByEmployeeID(payload);
    AppraisalDetail[] result = check response.Result.ensureType();
    appraisalId = result[0].AppraisalId;
    test:assertFalse(response.isError, msg = response.Message);
}

@test:Config {enable: true, dependsOn: [testGetAppraisalDetailsByEmployeeID]}
function testGetAppraisalDetailsByAppraisalID() returns error? {
    log:printInfo("Get appraisal details by appraisal ID");
    AppraisalDetailsByAppraisalIDRequest payload = {
        EmployeeId: user1,
        AppraisalId: appraisalId
    };
    AppraisalDetailsResponse response = check baseClient->getAppraisalDetailsByAppraisalID(payload);
    test:assertFalse(response.isError, msg = response.Message);
}
