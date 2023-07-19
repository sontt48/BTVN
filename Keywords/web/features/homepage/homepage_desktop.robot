***Keywords***

Get all categories names
  @{get_list_danhmuc}  SeleniumLibrary.Get WebElements  ${dict_homepage.locator_danhmuc}
  ${list_danhmuc}  BuiltIn.Create List
  FOR    ${index}    IN    @{get_list_danhmuc}
    ${danhmuc}  SeleniumLibrary.Get Text    locator=${index}
    Append To List   ${list_danhmuc}    ${danhmuc}
    Log   ${list_danhmuc}
  END
  [Return]  ${list_danhmuc}

Verify that desired category should be in category list
  [Arguments]  ${category_list}  ${desired_categoy_}
  List Should Contain Value  ${category_list}  ${desired_categoy_}

Click on category name
  [Arguments]  ${specific_category}
  ${locator_giaydepnu}  String.Replace String  ${dynamic_xpath}  _category_name  ${specific_category}
  SeleniumLibrary.Scroll Element Into View  ${locator_giaydepnu}
  SeleniumLibrary.Click Element  ${locator_giaydepnu} 