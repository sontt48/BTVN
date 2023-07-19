*** Settings ***
Resource    ${CURDIR}/../import/import_desktop.robot

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
  Verify product name is correctly at PDP    ${last_product_name_PLP}