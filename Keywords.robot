***Keywords***
Open Browser with Chrome
  [Arguments]  ${URL}
  Open Browser  ${URL}  Chrome
  Maximize Browser Window

Get all categories names
  @{get_list_danhmuc}  SeleniumLibrary.Get WebElements  ${locator_danhmuc}
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

Verify title after clicking on category name
  [Arguments]  ${expected_title}
  ${title}=  SeleniumLibrary.Get Title
  BuiltIn.Should Be Equal  ${title}  ${expected_title}

Click on find more button
  [Arguments]  ${section_name}

  ${locator_findmore}  String.Replace String  ${dynamic_findmore}    _desired_section  ${section_name}
  Wait Until Element Is Visible  ${locator_findmore}  
  Scroll Element Into View 	 locator=${locator_findmore}
  Click Element  ${locator_findmore}

Verify that filter item is displayed after choosing
  [Arguments]  ${filter_name}
  ${filter_locator}  String.Replace String  ${dynamic_filter_item}  _filter_name  ${filter_name}
  Wait Until Page Contains Element  ${filter_locator}

Select desired options
  [Arguments]  ${section_name}  ${option_name}
  Wait Until Keyword Succeeds    3x    1s    Click on find more button  ${section_name}
  ${locator_desired}  String.Replace String   ${desired_value}   _value  ${option_name}
  Wait Until Element Is Visible  ${locator_desired}   
  Click Element  ${locator_desired}
  Verify that filter item is displayed after choosing  ${option_name}
  
Get product name of the last product at PLP and go to PDP
  SeleniumLibrary.Wait Until Element Is Visible 	 locator=${last_item_name_plp}
  ${get_text_last_item_plp}  Get Text    ${last_item_name_plp}
  Set Test Variable     ${last_product_name_PLP}     ${get_text_last_item_plp}

Verify product name is correctly at PDP 
  [Arguments]    ${product_name_PLP}
  SeleniumLibrary.Wait Until Element Is Visible 	 ${product_name_PDP_locator} 
  ${product_name_PDP}=    SeleniumLibrary.Get Text 	 ${product_name_PDP_locator} 
  Should Be Equal As Strings    ${product_name_PLP}    ${product_name_PDP}

Filter to get expected product 
  Select desired options  Thương hiệu  Biti's
  Select desired options  Màu sắc  Bạc
  Select desired options  Kích cỡ  36