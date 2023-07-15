*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Resource  ${CURDIR}/Variables.robot
*** Keywords ***
Open browser with Chrome
  [Arguments]  ${URL}
  Open Browser  ${URL}  Chrome
  Maximize Browser Window
Get all category names
  [Arguments]  ${section_name_text}
  ${section_name}  String.Replace String  ${dynamic_category_list}  _section_name  ${section_name_text}
  @{category_list}  Get WebElements  ${section_name}
  ${list}  BuiltIn.Create List
  FOR    ${index}    IN    @{category_list}
      ${get_text}  Get Text    ${index}
      Append To List  ${list}  ${get_text}
  END
  [Return]  ${list}
Verify that desired categoury should be in list
  [Arguments]  ${list}  ${desired_category}
  List Should Contain Value    ${list}    ${desired_category}
Click on desired category
  [Arguments]  ${expected_cate}
  ${expected_category}  String.Replace String  ${dynamic_category}  _category_name  ${expected_cate}
  Wait Until Element Is Visible    ${expected_category}
  Scroll Element Into View  ${expected_category}
  Click Element    ${expected_category}
Verify that title should be equal
  [Arguments]  ${title}
  ${title_URL}  Get Title
  Should Be Equal  ${title_URL}  ${title}
Click find more button
  [Arguments]  ${cate_name}
  ${find_more_locator}  String.Replace String  ${dynamic_findmore}  _category_name  ${cate_name}
  Click Element  ${find_more_locator}
Click on desired options
  [Arguments]  ${cate_name}  ${option_name}
  Click find more button    ${cate_name}
  ${option_locator}  String.Replace String  ${dynamic_option}  _option_name  ${option_name}
  Wait Until Element Is Visible  ${option_locator}
  Scroll Element Into View  ${option_locator}
  Click Element    ${option_locator}
Get name of the last product in PLP
  ${name_PLP}  Get Text    ${last_item_PLP}
  [Return]  ${name_PLP}
Get name of the last product in PDP
  Click Element    ${last_item_PLP}
  ${name_PDP}  Wait Until Keyword Succeeds    3x    1s   Get Text    ${last_item_PDP}
  [Return]  ${name_PDP}
Verify that names in 2 pages should be the same
  ${name_PLP}  Get name of the last product in PLP
  ${name_PDP}  Get name of the last product in PDP
  Should Be Equal  ${name_PLP}  ${name_PDP}
  