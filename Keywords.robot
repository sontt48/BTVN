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
  # ${section_name}  String.Replace String  ${dynamic_category_list}  _section_name  Nổi bật
  ${section_name}  String.Replace String  ${dynamic_category_list}  _section_name  Nổi bật
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