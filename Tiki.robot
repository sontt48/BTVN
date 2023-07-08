*** Settings ***
Library  SeleniumLibrary
Library  String
Library    Collections

*** Variables ***
${dynamic_xpath}  //a[@title="_category_name"]
${locator_danhmuc}  //div[text()='Danh mục']/parent::div/a
${tiki_logo}  //div[@class='Middle__LeftContainer-sc-vop1h1-1 hBRVdJ']//a[@data-view-id='header_main_logo']
${dynamic_findmore}  //div[@data-view-label="_desired_section"]/a[text()="Xem thêm"]
${dynamic_filter_item}  //div[@class='filter-items']/p[@class='item' and text()="_filter_name"]
${desired_value}  //span[text()="_value"]
${last_item}  (//div[@data-view-id='product_list_container']/div/a[@class='product-item'])[last()]
${last_item_name_plp}  (//div[@data-view-id='product_list_container']/div/a[@class='product-item'])[last()]//h3
${last_item_name_pdp}  //div[@class='styles__StyledProductContent-sc-1f8f774-0 ewqXRk']//h1
${URL_tiki}  https://tiki.vn/
${desired_categoy_}  Giày - Dép nữ
${expected_title}  Giày - Dép nữ chính hãng, giá tốt Tháng 7, 2023 | Tiki
${product_name_PDP_locator}    //h1[@class="title"]

*** Keywords ***
Open Browser with Chrome
  [Arguments]  ${URL}
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
  Click Element    ${last_item}

Verify product name is correctly at PDP 
  [Arguments]    ${product_name_PLP}
  SeleniumLibrary.Wait Until Element Is Visible 	 ${product_name_PDP_locator} 
  ${product_name_PDP}=    SeleniumLibrary.Get Text 	 ${product_name_PDP_locator} 
  Should Be Equal As Strings    ${product_name_PLP}    ${product_name_PDP}

Filter to get expected product 
  Select desired options  Thương hiệu  Biti's
  Select desired options  Màu sắc  Bạc
  Select desired options  Kích cỡ  36

*** Test Cases ***
TC1
  Open Browser with Chrome    ${URL_tiki}
  ${list} =  Get all categories names  
  Verify that desired category should be in category list  ${list}  ${desired_categoy_}
  Click on category name    ${desired_categoy_}
  Verify title after clicking on category name  ${expected_title}
  Filter to get expected product 
  Wait Until Keyword Succeeds    3x    1s    Get product name of the last product at PLP and go to PDP
  Verify product name is correctly at PDP    ${last_product_name_PLP}