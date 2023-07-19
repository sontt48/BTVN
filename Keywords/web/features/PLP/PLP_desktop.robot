***Keywords***

Verify title after clicking on category name
  [Arguments]  ${expected_title}
  ${title}=  SeleniumLibrary.Get Title
  BuiltIn.Should Be Equal  ${title}  ${expected_title}


Filter to get expected product 
  Select desired options  Thương hiệu  Biti's
  Select desired options  Màu sắc  Bạc
  Select desired options  Kích cỡ  36

Select desired options
  [Arguments]  ${section_name}  ${option_name}
  Wait Until Keyword Succeeds    3x    1s    Click on find more button  ${section_name}
  ${locator_desired}  String.Replace String   ${desired_value}   _value  ${option_name}
  Wait Until Element Is Visible  ${locator_desired}   
  Click Element  ${locator_desired}
  Verify that filter item is displayed after choosing  ${option_name}

Click on find more button
  [Arguments]  ${section_name}

  ${locator_findmore}  String.Replace String  ${dynamic_findmore}    _desired_section  ${section_name}
  Wait Until Element Is Visible  ${locator_findmore}  
  Scroll Element Into View 	 locator=${locator_findmore}
  Click Element  ${locator_findmore}

Get product name of the last product at PLP and go to PDP
  SeleniumLibrary.Wait Until Element Is Visible 	 locator=${last_item_name_plp}
  ${get_text_last_item_plp}  Get Text    ${last_item_name_plp}
  Set Test Variable     ${last_product_name_PLP}     ${get_text_last_item_plp}
  Click on the last product to go PDP    ${last_item}

Click on the last product to go PDP 
  Click on a element    ${last_item}