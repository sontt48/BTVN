***Settings***
Resource    ${CURDIR}/../import/import_desktop.robot
Test Setup    Open Browser with Chrome    ${test_data.orange_HRM}
Test Teardown    Close Browser


***Variables***
${username_locator}    //input[@name="username"]
${password_locator}    //input[@name="password"]
${login_btn}               //button[@type="submit"]
${image_logo}       //img[@alt="client brand banner"]

***Test Cases***
check login happy case 
    Check log in happy case    ${1}

check login unhappy case  
    Check log in unhappy case    ${2}


