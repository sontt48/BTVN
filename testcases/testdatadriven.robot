*** Settings ***
Documentation   To validate the Login form
Library     SeleniumLibrary
Test Teardown   Close Browser
Test Template   Validate UnSuccesful Login
# Documentation   To validate the Login form
# Library     SeleniumLibrary
# Test Template   Validate UnSuccesful Login
 
*** Variables ***
${browser_name}     Chrome
${login_btn}        css:.orangehrm-login-button
${login_error_message}      css:.oxd-alert-content--error
 
 
*** Test Cases ***              username        password
Invalid username                abc             admin123
Invalid password                Admin           abc
Special characters              @#$             %$^&
Invalid username and password   abc             abc123
 
 
*** Keywords ***
Validate UnSuccesful Login
    [Arguments]     ${username}     ${password}
    Open the Browser with URL
    Fill the login form         ${username}      ${password}
    Verify the error message is correct
    Close Browser Session
 
Open the Browser with URL
    Create Webdriver    ${browser_name}  executable_path=/Vibha_Personal/RobotFramework_Demo/drivers/${browser_name}
    Go To    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Maximize Browser Window
    Set Selenium Implicit Wait    2
 
Fill the login Form
    [arguments]         ${username}          ${password}
    Input Text          name:username        ${username}
    Input Password      name:password        ${password}
    Click Button        ${login_btn}
 
 
Verify the error message is correct
   ${result}=   Get Text    ${login_error_message}
   Should Be Equal As Strings     ${result}     Invalid credentials
 
Close Browser Session
    Close Browser