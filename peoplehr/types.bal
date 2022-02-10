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
 
type Authentication record {
    string APIKey?;
    string Action?;
};

# Represents common fields of the response
#
# + isError - Indicates whether the response is an error or not
# + Status - The status of the error  
# + Message - The message of the response  
public type PeopleHRGenericResponse record {
    boolean isError;
    int Status;
    string Message;
};

# Represents the response type of `getQueryByName` operation
#
# + Result - The results as an json array  
public type QueryDetail record {|
    *PeopleHRGenericResponse;
    json Result;
|};

# Represents the response type of `getAllEmployeeDetail` operation
#
# + Result - All employee detail
public type EmployeesResponse record {|
    *PeopleHRGenericResponse;
    Employee[] Result;
|};

# Represents the response type of `getEmployeeDetailById` operation
#
# + Result - The response details of the operation
public type EmployeeResponse record {|
    *PeopleHRGenericResponse;
    Employee? Result;
|};

# Represents the response type of `updateEmployeeDetail` operation
#
# + Result - The response details of the operation 
public type AuthenticationResponse record {|
    *PeopleHRGenericResponse;
    EmployeeVerification Result;
|};

# The Results of the employee verification
#
# + EmployeeId - The employee Id of the verified user  
public type EmployeeVerification record {
    string EmployeeId?;
};

# Represents the response type of `UpdateEmployeeId` operation
#
# + Result - The response of the operation 
public type OperationStatus record {
    *PeopleHRGenericResponse;
    json? Result;
};

# Represents the response type of `GetHolidayDetail` operation
# 
# + Result - Holiday Detail
public type HolidayGetResponse record {|
    *PeopleHRGenericResponse;
    Holiday[] Result;
|};

# Represents the inputs of `checkAuthentication` operation
#
# + EmailAddress - Email Address of the user
# + Password - The password of the user
public type AuthenticationInfo record {|
    string EmailAddress;
    string Password;
    *Authentication;
|};

# Represents the response of `GetSalaryDetail` operation
# 
# + Result - Salary Detail
public type SalaryDetailGetResponse record {|
    *PeopleHRGenericResponse;
    Salary[] Result;
|};

# Represents the input of `GetQueryResult` operation
#
# + QueryName - The Query Name 
public type QueryResultGetRequest record {|
    string QueryName;
    *Authentication;
|};

# Represents the input of `UpdateEmployeeId` operation
#
# + ReasonForChange - The reason for change
# + OldEmployeeId - The old employee ID  
# + NewEmployeeId - The new employee ID
public type EmployeeIdUpdateRequest record {|
    string ReasonForChange;
    string OldEmployeeId;
    string NewEmployeeId;
    *Authentication;
|};

# Represents the input of  getting all employee data operation
#
# + IncludeLeavers -  Indicates whether to include the leavers or not.  
public type AllEmployeesRequest record {|
    boolean IncludeLeavers;
    *Authentication;
|};

# Represents the input of  getting employee detail operation
#
# + EmployeeId - The employee ID 
public type EmployeeRequest record {|
    string EmployeeId;
    *Authentication;
|};

# Represents the response of `GetVacancy` operation  
#
# + Result - The response of the operation
public type VacancyGetResponse record {|
    *PeopleHRGenericResponse;
    Vacancy? Result;
|};

# Represents the response of `GetAllVacancies` operation
#
# + Result - The response of the operation
public type AllVacancies record {|
    *PeopleHRGenericResponse;
    Vacancy[] Result;
|};

# Represents a vacancy record
#
# + VacancyName - The vacancy Name
# + VacancyDescription - The vacancy detail 
# + Company - The company
# + Location - The location of the vacancy  
# + Department - The department of the vacancy  
# + Status - The status of the vacancy  
# + ClosingDate - The closing date  
# + Reference - The reference  
# + SalaryRange - The salary range of the job  
# + JobDescription - The job detail
# + IsHideSalary - Indicates whether to hide the salary  
# + JobTitle - The job title  
# + VacancyType - The vacancy type
# + City - The city of the vacancy  
# + Country - The country of the vacancy
# + Experience - The experience expected  
# + JobBordUrl - The URL for job details  
# + AdditionalQuestions - Additional questions  
# + InternalQuestions - Internal questions on the vacancy  
public type Vacancy record {
    string? VacancyName?;
    string? VacancyDescription?;
    string? Company?;
    string? Location?;
    string? Department?;
    int? Status?;
    string? ClosingDate?;
    string? Reference?;
    string? SalaryRange?;
    string? JobDescription?;
    boolean? IsHideSalary?;
    string? JobTitle?;
    string? VacancyType?;
    string? City?;
    string? Country?;
    string? Experience?;
    string? JobBordUrl?;
    json[]? AdditionalQuestions?;
    json[]? InternalQuestions?;
};

# Represents the details of the new vacancy
#
# + VacancyName - The name of the vacancy  
# + VacancyDescription - The description of the vacancy  
# + Company - The company  
# + Location - The location  
# + Department - The department  
# + ClosingDate - The closing date  
# + Reference - The reference  
# + Comment - The comment  
# + SalaryRange - The salary range  
# + JobDescription - The job description  
# + IsCoverLetterMandatory - Indicates whether the cover letter is mandatory or not  
# + IsResumeMandatory - Indicates whether the resume is mandatory or not
# + IsHideSalary - Indicates whether to hide the salary of the vacancy
# + VacancyType - The vacancy type  
# + JobTitle - The title of the job  
# + City - The city of the job  
# + Country - The country of the job  
# + Experience - The experience expected  
public type NewVacancy record {|
    string VacancyName?;
    string VacancyDescription?;
    string Company?;
    string Location?;
    string Department?;
    string ClosingDate?;
    string Reference?;
    string Comment?;
    string SalaryRange?;
    string JobDescription?;
    boolean IsCoverLetterMandatory?;
    boolean IsResumeMandatory?;
    boolean IsHideSalary?;
    string VacancyType?;
    string JobTitle?;
    string City?;
    string Country?;
    string Experience?;
    *Authentication;
|};

# Represents an employee type record
#
# + EmployeeId - The employee ID
# + Title - The title of the employee
# + FirstName - The first name of the employee
# + LastName - The last name of the employee
# + OtherName - Other names
# + KnownAs - The employee is known as
# + EmailId - Email ID
# + StartDate - The start date
# + DateOfBirth - The date of birth
# + JobRole - The job role
# + Company - The company
# + CompanyEffectiveDate - The effective date
# + Location - The location
# + LocationEffectiveDate - The effective date of the location
# + Department - The department of the employee
# + DepartmentEffectiveDate - The effective date of the department  
# + JobRoleChangeDate - The job role change date
# + ReportsTo - Employee reports to
# + ReportsToEffectiveDate - Reports to effective date
# + ReportsToEmployeeId - The ID of the employee whom should be reported
# + ReportsToEmailAddress - The email address of the employee whom should be reported
# + NISNumber - NIS number 
# + Nationality - The nationality of the employee
# + EmploymentType - The type of the employee
# + EmploymentTypeEffectiveDate - The effective date of employment type
# + EmployeeStatus - The status of employee 
# + HolidayAllowanceDays - The holiday allowance days
# + HolidayAllowanceMins - The holiday allowance mins
# + NoticePeriod - The notice period
# + ProbationEndDate - The end date of the probation
# + Gender - The gender
# + ContactDetail - The contact detail
# + OtherContact - The other contact
# + RightToWork - Right to work 
# + BackgroundDetail - background detail
# + BankDetail - The bank detail
# + EmploymentDetail - The employment detail
# + lstFieldHistoryJobrole - The last field history job role
# + LeavingDate - The leaving date
# + ReasonForLeaving - Reason for leaving
# + EmployeeImage - The employee image
# + APIColumn1 - API column 1
# + APIColumn2 - API column 2  
# + APIColumn3 - API column 3 
# + APIColumn4 - API column 4
# + APIColumn5 - API column 5
public type Employee record {
    ValueDetails EmployeeId;
    ValueDetails Title?;
    ValueDetails FirstName?;
    ValueDetails LastName?;
    ValueDetails OtherName?;
    ValueDetails KnownAs?;
    ValueDetails EmailId;
    ValueDetails StartDate?;
    ValueDetails DateOfBirth?;
    ValueDetails JobRole?;
    ValueDetails Company;
    ValueDetails CompanyEffectiveDate?;
    ValueDetails Location?;
    ValueDetails LocationEffectiveDate?;
    ValueDetails Department?;
    ValueDetails DepartmentEffectiveDate?;
    ValueDetails JobRoleChangeDate?;
    ValueDetails ReportsTo?;
    ValueDetails ReportsToEffectiveDate?;
    ValueDetails ReportsToEmployeeId?;
    ValueDetails ReportsToEmailAddress?;
    ValueDetails NISNumber?;
    ValueDetails Nationality?;
    ValueDetails EmploymentType?;
    ValueDetails EmploymentTypeEffectiveDate?;
    ValueDetails EmployeeStatus?;
    ValueDetails HolidayAllowanceDays?;
    ValueDetails HolidayAllowanceMins?;
    ValueDetails NoticePeriod?;
    ValueDetails ProbationEndDate?;
    ValueDetails Gender?;
    ContactDetail ContactDetail;
    OtherContact[] OtherContact?;
    RightToWork[] RightToWork?;
    ValueDetails[] BackgroundDetail?;
    ValueDetails BankDetail?;
    ValueDetails EmploymentDetail?;
    FieldHistoryForJobRole[]? lstFieldHistoryJobrole?;
    string LeavingDate?;
    string ReasonForLeaving?;
    string EmployeeImage?;
    string APIColumn1?;
    string APIColumn2?;
    string APIColumn3?;
    string APIColumn4?;
    string APIColumn5?;
};

# Represents bank details
#
# + BankName - The name of the bank
# + BankAddress - The address of the bank  
# + BankCode - The code of the bank
# + AccountNumber - Account  number
# + AccountName - Account name  
public type BankDetail record {|
    ValueDetails BankName?;
    ValueDetails BankAddress?;
    ValueDetails BankCode?;
    ValueDetails AccountNumber?;
    ValueDetails AccountName?;

|};

# Represents the background details
#
# + CheckType - The type of the check  
# + CompletionDate - The completion date
# + ExpiryDate - The expiry date
# + BackgroundDetailComments - The background detail comments
public type BackgroundDetail record {|
    ValueDetails CheckType?;
    ValueDetails CompletionDate?;
    ValueDetails ExpiryDate?;
    ValueDetails BackgroundDetailComments?;
|};

# Represents the contact detail
#
# + Address - The address of the contact details  
# + WorkPhoneNumber - The work phone number  
# + PersonalPhoneNumber - The personal phone number  
# + PersonalEmail - The personal email
# + Mobile - The mobile
public type ContactDetail record {
    ValueDetails Address?;
    ValueDetails WorkPhoneNumber?;
    ValueDetails PersonalPhoneNumber?;
    ValueDetails PersonalEmail?;
    ValueDetails Mobile?;
};

# Represents valueDetails type
#
# + DisplayValue - The display value  
# + FieldHistory - The field history  
# + FieldHistoryForJobRole - The field history for job role
# + FieldHistoryForEffectiveDate - The field history for effective date
public type ValueDetails record {
    string DisplayValue?;
    FieldHistory[]? FieldHistory?;
    FieldHistory[]? FieldHistoryForJobRole?;
    FieldHistoryForEffectiveDate[]? FieldHistoryForEffectiveDate?;
};

# Represents the field history
#
# + OldValue - The old value
# + NewValue - The new value
# + ChangedOn - The changed on
# + ReasonForChange - The reason for change
public type FieldHistory record {
    string OldValue?;
    string NewValue?;
    string ChangedOn?;
    string ReasonForChange?;
};

# Represents the field history for effective date
#
# + FieldData - The field date  
# + EffectiveDate - The effective date  
# + ChangedOn - The changed on
# + ReasonForChange - The reason for change
public type FieldHistoryForEffectiveDate record {|
    string FieldData;
    string EffectiveDate;
    string ChangedOn;
    string ReasonForChange;
|};

# Represents the other contact
#
# + OtherContactName - The other contact name  
# + Relationship - The relationship
# + OtherContactAddress - The other contact address
# + Telephone - The telephone  
# + Mobile - The mobile  
# + Comments - The comments  
public type OtherContact record {
    ValueDetails OtherContactName?;
    ValueDetails Relationship?;
    ValueDetails OtherContactAddress?;
    ValueDetails Telephone?;
    ValueDetails Mobile?;
    ValueDetails Comments?;
};

# Represents right to work type record
#
# + DocumentType - The document type
# + DocumentId - The document ID
# + ValidFrom - The valid from
# + ValidTo - The valid to
# + Duration - The duration
# + RightToWorkComments - The right to work comments
public type RightToWork record {|
    ValueDetails DocumentType?;
    ValueDetails DocumentId?;
    ValueDetails ValidFrom?;
    ValueDetails ValidTo?;
    ValueDetails Duration?;
    ValueDetails RightToWorkComments?;
|};

# Represents field history for job role type record
#
# + JobRole - The job role  
# + EffectiveDate - The effective date
# + ChangedOn - The changed on
# + ReasonForChange - The reason for change
public type FieldHistoryForJobRole record {|
    string JobRole;
    string EffectiveDate;
    string ChangedOn;
    string ReasonForChange;
|};

# Represents a new employee type record
#
# + EmployeeId - The employee ID  
# + Title - The title of the employee  
# + FirstName - The first name of the employee  
# + LastName - The last name of the employee  
# + Email - The email address  
# + Gender - The gender  
# + StartDate - The start date  
# + DateOfBirth - The date of birth  
# + ReportsTo - Employee reports to  
# + JobRole - The job role  
# + JobRoleEffectiveDate - Field Description  
# + Company - The company  
# + Location - The location  
# + Department - The department of the employee  
# + NationalInsuranceNumber - Field Description  
# + Nationality - The nationality of the employee  
# + EmploymentType - The type of the employee  
# + EntitlementThisYear - The entitlement this year  
# + EntitlementNextYear - The entitlement next year  
# + Address - The address of the employee  
# + PersonalPhoneNumber - The personal phone number  
# + Payroll - The payroll  
# + Time - The time  
# + Rota - Rota  
# + CRM - CRM value  
# + ATS - ATS value  
# + Performance - The performance  
# + Benefits - The benefits  
# + System1 - The system1  
# + System2 - The system2   
# + System3 - The system3
# + APIColumn1 - API column 1  
# + APIColumn2 - API column 2  
# + APIColumn3 - API column 3  
# + APIColumn4 - API column 4  
# + APIColumn5 - API column 5  
# + PersonalEmail - Personal email
# + MethodOfRecruitment - Method of recruitment
public type NewEmployeeRequest record {|
    string EmployeeId;
    string Title?;
    string FirstName;
    string LastName;
    string Email?;
    string Gender?;
    string StartDate;
    string DateOfBirth?;
    string ReportsTo?;
    string JobRole;
    string JobRoleEffectiveDate;
    string Company?;
    string Location;
    string Department;
    string NationalInsuranceNumber?;
    string Nationality?;
    string EmploymentType?;
    string EntitlementThisYear?;
    string EntitlementNextYear?;
    string Address?;
    string PersonalPhoneNumber?;
    string Payroll?;
    string Time?;
    string Rota?;
    string CRM?;
    string ATS?;
    string Performance?;
    string Benefits?;
    string System1?;
    string System2?;
    string System3?;
    string APIColumn1?;
    string APIColumn2?;
    string APIColumn3?;
    string APIColumn4?;
    string APIColumn5?;
    string PersonalEmail?;
    string MethodOfRecruitment?;
    *Authentication;
|};

# Represents a new employee type record
#
# + EmployeeId - The employee ID  
# + Title - The title of the employee  
# + FirstName - The first name of the employee  
# + LastName - The last name of the employee  
# + Email - The email address  
# + Gender - The gender  
# + DateOfBirth - The date of birth  
# + StartDate - The start date  
# + ReportsTo - Employee reports to  
# + ReportsToEffectiveDate - The reports to effective date
# + Company - The company  
# + CompanyEffectiveDate - The company effective date  
# + JobRole - The job role  
# + JobRoleEffectiveDate - The job role effective date  
# + Location - The location  
# + LocationEffectiveDate - The effective date of location
# + Department - The department of the employee
# + DepartmentEffectiveDate - The effective date of department  
# + NationalInsuranceNumber - The national insurance number
# + Nationality - The nationality of the employee  
# + EmploymentType - The type of the employee  
# + EmploymentTypeEffectiveDate - The effective date of employee type  
# + Address - The address of the employee  
# + PersonalPhoneNumber - The personal phone number  
# + Payroll - The payroll  
# + Time - The time  
# + Rota - Rota  
# + CRM - CRM value  
# + ATS - ATS value  
# + Performance - The performance  
# + Benefits - The benefits  
# + System1 - The system1  
# + System2 - The system2  
# + System3 - The system3  
# + APIColumn1 - API column 1  
# + APIColumn2 - API column 2  
# + APIColumn3 - API column 3  
# + APIColumn4 - API column 4  
# + APIColumn5 - API column 5  
# + PersonalEmail - Personal email  
# + MethodOfRecruitment - Method of recruitment
# + ReasonForChange - Reason For Change
public type EmployeeUpdateRequest record {|
    string EmployeeId;
    string Title?;
    string FirstName?;
    string LastName?;
    string Email?;
    string Gender?;
    string DateOfBirth?;
    string StartDate?;
    string ReportsTo?;
    string ReportsToEffectiveDate?;
    string Company?;
    string CompanyEffectiveDate?;
    string JobRole?;
    string JobRoleEffectiveDate?;
    string Location?;
    string LocationEffectiveDate?;
    string Department?;
    string DepartmentEffectiveDate?;
    string NationalInsuranceNumber?;
    string Nationality?;
    string EmploymentType?;
    string EmploymentTypeEffectiveDate?;
    string Address?;
    string PersonalPhoneNumber?;
    string Payroll?;
    string Time?;
    string Rota?;
    string CRM?;
    string ATS?;
    string Performance?;
    string Benefits?;
    string System1?;
    string System2?;
    string System3?;
    string APIColumn1?;
    string APIColumn2?;
    string APIColumn3?;
    string APIColumn4?;
    string APIColumn5?;
    string PersonalEmail?;
    string MethodOfRecruitment?;
    string ReasonForChange;
    *Authentication;
|};

# Represent employee leaver status type record
#
# + EmployeeId - employee ID  
# + ReasonforLeaving - Reason for leaving
# + AdditionalComments - Additional comments
# + FinalEmploymentDate - final employment date 
# + FinalWorkingDate - Final working date
# + MarkasLeaverImmediately - Mark as leaver immediately
# + ReportsTo - Reports to
# + ReEmployable - Re-employable
# + SupportingComments - The supporting comments  
public type EmployeeLeaverStatus record {|
    string EmployeeId;
    string ReasonforLeaving;
    string AdditionalComments?;
    string FinalEmploymentDate;
    string FinalWorkingDate?;
    string MarkasLeaverImmediately?;
    string ReportsTo?;
    string ReEmployable?;
    string SupportingComments?;
    *Authentication;
|};

# Represents salary detail request type record
#
# + EmployeeId - The employee ID  
# + IsIncludeHistory - Indicates whether to include the history
public type SalaryDetailRequest record {|
    string EmployeeId;
    boolean IsIncludeHistory;
    *Authentication;
|};

# Represents the request payload of `GetVacancyResult` operation
#
# + VacancyReference - Field Description  
public type GetVacancyResultRequest record {|
    string VacancyReference;
    *Authentication;
|};

# Represents salary detail type record
#
# + EffectiveFrom - The effective from  
# + SalaryType - The salary type
# + PaymentFrequency - The payment frequency
# + SalaryAmount - The salary amount
# + TotalSalaryAmount - The total salary amount
# + Currency - The currency
# + ChangeReason - The change reason
# + Comments - The comments
# + Deductions - The deductions
# + Entitlements - The entitlements
public type Salary record {|
    string EffectiveFrom?;
    string SalaryType?;
    string PaymentFrequency?;
    string SalaryAmount?;
    string TotalSalaryAmount?;
    string Currency?;
    string ChangeReason?;
    string Comments?;
    DeductionsOrEntitlements[] Deductions?;
    DeductionsOrEntitlements[] Entitlements?;
|};

# Represents deductions Or entitlements type record
#
# + Deduction - deduction value
# + Entitlement - entitlement value  
# + Amount - The amount 
# + Percentage - The percentage
# + Comments - The comments
# + IncludeInTotalSalary - Indicates whether includes in total salary
# + DisplayAsAmountOrPercentage - The display as amount or percentage  
public type DeductionsOrEntitlements record {|
    string Deduction?;
    string Entitlement?;
    string Amount?;
    string Percentage?;
    string Comments?;
    string IncludeInTotalSalary?;
    string DisplayAsAmountOrPercentage?;
|};

# Represents new holiday type record
#
# + EmployeeId - The employee ID  
# + DurationType - The duration type
# + StartDate - The start date
# + EndDate - The end date
# + DurationInDays - The duration in days
# + DurationInMinutes - The duration in minutes  
# + PartOfDay - The part of day
# + Comments - The comments
public type NewHolidayRequest record {|
    string EmployeeId;
    string DurationType?;
    string StartDate?;
    string EndDate?;
    string DurationInDays?;
    string DurationInMinutes?;
    string PartOfDay?;
    string Comments?;
    *Authentication;
|};

# Represents holiday update type record
#
# + EmployeeId - The employee ID  
# + OldStartDate - The old start date  
# + OldEndDate - The old end date
# + DurationType - The duration type
# + StartDate - The start date
# + EndDate - The end date
# + DurationInDays - The duration in days
# + DurationInMinutes - The duration in minutes  
# + PartOfDay - The part of day
# + Comments - Comments
public type HolidayUpdateRequest record {|
    string EmployeeId;
    string OldStartDate;
    string OldEndDate;
    string DurationType;
    string StartDate;
    string EndDate;
    string DurationInDays;
    string DurationInMinutes;
    string PartOfDay?;
    string Comments?;
    *Authentication;
|};

# Represents holiday type record
#
# + StartDate - The start date  
# + EndDate - The end date  
# + DurationType - The duration type  
# + DurationInDays - The duration in days  
# + DurationInMinutes - The duration in minutes  
# + DurationInDaysThisPeriod - The duration in days this period
# + DurationInMinutesThisPeriod - The duration in minutes this period
# + PartOfDay - Part of day
# + RequesterComments - The requester comments
# + ApproverComments - The approver comments
# + Approver - Approver detail
# + Status - The status  
# + LastActionDateTime - The last action date time  
# + IsToilHoliday - indicates whether isToil Holiday
public type Holiday record {|
    *Authentication;
    string StartDate?;
    string EndDate?;
    int DurationType?;
    int DurationInDays?;
    int DurationInMinutes?;
    int DurationInDaysThisPeriod?;
    int DurationInMinutesThisPeriod?;
    string PartOfDay?;
    string RequesterComments?;
    string ApproverComments?;
    string Approver?;
    string Status?;
    string LastActionDateTime?;
    boolean IsToilHoliday?;
|};

# Represents holiday detail 
#
# + EmployeeId - The employee ID  
# + StartDate - Start date  
# + EndDate - End date  
public type HolidayDetail record {|
    string EmployeeId;
    string StartDate?;
    string EndDate?;
    *Authentication;
|};
