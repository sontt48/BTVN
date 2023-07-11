***Keywords***
open browser with Chrome 
  [Arguments]   ${URL}
  Open Browser  ${URL}  Chrome 
  Maximize Browser Window

Get all categories names
  @{get_list_danhmuc}  SeleniumLibrary.Get WebElements  ${locator_danhmuc}
  ${list_danhmuc}  BuiltIn.Create List
  FOR    ${index}    IN    @{get_list_danhmuc}
    ${danhmuc}  SeleniumLibrary.Get Text    locator=${index}
    Append To List  ${list_danhmuc}  ${danhmuc}  
  END
  [Return]  ${list_danhmuc}

Verify that desired category should be in category list
  [Arguments]  ${category_list}  ${desired_categoy_}
  List Should Contain Value  ${category_list}  ${desired_categoy_}

Get all noi bat names
  @{get_list_noibat}  SeleniumLibrary.Get WebElements  ${locator_noibat}
  ${list_noibat}  BuiltIn.Create List
  FOR    ${index}    IN    @{get_list_noibat}
    ${noibat}  SeleniumLibrary.Get Text    locator=${index}
    Append To List  ${list_noibat}  ${noibat}  
  END
  [Return]  ${list_noibat}
 