*** Settings ***
Resource    ${CURDIR}/../import/import_desktop.robot
Test Setup      Open Browser with Chrome    ${test_data.URL_tiki}
Test Teardown   Close Browser
Force Tags   tiki

***Keywords***
get all students detail  
  [Arguments]    ${endpoint} 
 
  ${response}=    REST.GET   ${endpoint}
  REST.Integer    response status    200
  ${response_body}=    REST.Output    response body
  [Return]    ${response_body}

create new student 
  [Arguments]   ${last_name}    ${first_name}
  ${request}=      Get Templated Data From path     ${CURDIR}/body.json     return_type=json
  ${request}=    JSONLibrary.Update Value To Json    ${request}    $.first_name    ${first_name} 
  ${request}=    JSONLibrary.Update Value To Json    ${request}    $.last_name    ${last_name}
  ${body}=    BuiltIn.Evaluate    json.dumps($request)    json
  ${response}=    REST.Post    endpoint=https://thetestingworldapi.com/api/studentsDetails   body=${body}    
  REST.Integer    response status    201


***Variables***
${sheetname}    "Sheet1"

*** Test Cases ***
Check product on Tiki
  [Tags]  tiki
  Open Browser with Chrome    ${test_data.URL_tiki}
  ${list} =  Get all categories names  
  Verify that desired category should be in category list  ${list}  ${expected_category}


  Click on category name    ${expected_category}
  Verify title after clicking on category name  ${expected_title}
  Filter to get expected product 
  
  Wait Until Keyword Succeeds    3x    1s    Get product name of the last product at PLP and go to PDP
  Click on the last product to go PDP 
  Verify product name is correctly at PDP    ${last_product_name_PLP}

test api
  [Tags]   api 

  ${response}=    REST.GET   https://tiki.vn/api/v2/products/263582290
  Log    ${response}
  ${response_body}=    REST.Output    response body
  ${name_product}=    Get Value From Json    ${response_body}  $.name 
  Log    ${name_product}

test api post  
  [Tags]  api_post
  # ${request}=      Get Templated Data From path     ${CURDIR}/body.json     return_type=json
  Set test variable     ${body}    "grant_type=password&username=apiusertestcrcuat&password=2023!piusertestCRC"                      
  # Log    ${body}
  ${headers}=    Create Dictionary    Content-Type=application/x-www-form-urlencoded   Authorization=Basic b21uaWNvbXBvbmVudC4xLjAuMDpiNHM4cmdUeWc1NVhZTnVu
  ${response}=    REST.Post    endpoint=https://crcps-auth.omni.manh.com/oauth/token    body=${body}    headers=&{headers}
  Log    ${response}
  REST.Integer    response status    200
  ${response}=    REST.Output    response body

test_api_flow
  [Tags]    api_flow 
  create new student    sonttttttt09090      sieu dep trai
  ${student_detail}=    get all students detail    https://thetestingworldapi.com/api/studentsDetails
  # ${student}=    Get Value From Json    ${student_detail}     $..[?(@.last_name = 'sonttttttt09090')]

test_data 
  [Tags]    data 
  Read all data from excel





  

