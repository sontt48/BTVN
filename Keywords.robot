***Keywords***
open browser with Chrome 
  [Arguments]   ${URL}
  Open Browser  ${URL}  Chrome 
  Maximize Browser Window

# Get all categories names
#   @{get_list_danhmuc}  SeleniumLibrary.Get WebElements  ${locator_danhmuc}
#   ${list_danhmuc}  BuiltIn.Create List
#   FOR    ${index}    IN    @{get_list_danhmuc}
#     ${danhmuc}  SeleniumLibrary.Get Text    locator=${index}
#     Append To List  ${list_danhmuc}  ${danhmuc}  
#   END
#   [Return]  ${list_danhmuc}

Verify that desired category should be in category list
  [Arguments]  ${category_list}  ${desired_categoy_}
  List Should Contain Value  ${category_list}  ${desired_categoy_}

Get list
  [Arguments]  ${Section_name}
  @{get_list}  SeleniumLibrary.Get WebElements  ${Section_name} 
  ${list}  BuiltIn.Create List
  FOR    ${index}    IN    @{get_list}
    ${item}  SeleniumLibrary.Get Text    locator=${index}
    Append To List  ${list}  ${item}  
  END
  [Return]  ${list}

Click on category names
  [Arguments]  ${Section_name}
  ${specific_category}  String.Replace String  ${locator_category}  _category   ${Section_name} 
  #thay thế cụ thể 1 giá trị cho category  
  Scroll Element Into View   ${specific_category}
  Click Element   ${specific_category}

Verify title should be equa 
  [Arguments]  ${expected_title} 
  ${title}=  SeleniumLibrary.Get Title
  BuiltIn.Should Be Equal   ${title}   ${expected_title}

  


 