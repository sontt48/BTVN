*** Settings ***
Library  SeleniumLibrary
Library  String
Library    Collections
*** Variables ***
${dynamic_xpath}  //a[@title="_category_name"]
${locator_danhmuc}  //div[text()='Danh mục']/parent::div/a
${tiki_logo}  //div[@class='Middle__LeftContainer-sc-vop1h1-1 hBRVdJ']//a[@data-view-id='header_main_logo']
${dynamic_category_text}  //div[@class='SideBar__Root-sc-18bme9p-0 ctRRBS']/div/h4[text()="category_name"]
${dynamic_findmore}  //div[@data-view-label="desired_category"]/a[@class='toggler']
${desired_value}  //span[text()="_value"]
${last_item}  (//div[@data-view-id='product_list_container']/div/a[@class='product-item'])[last()]
${last_item_name_plp}  (//div[@data-view-id='product_list_container']/div/a[@class='product-item'])[last()]//h3
${last_item_name_pdp}  //div[@class='styles__StyledProductContent-sc-1f8f774-0 ewqXRk']//h1
*** Test Cases ***
TC1
  Open Browser  https://tiki.vn  Chrome
  Maximize Browser Window
  ${locator}  String.Replace String  ${dynamic_xpath}  _category_name  Giá Rẻ Mỗi Ngày
  Click Element  locator=${locator}
  Click Element    ${tiki_logo}
  Wait Until Element Is Visible  ${locator_danhmuc}
  @{get_list_danhmuc}  SeleniumLibrary.Get WebElements  ${locator_danhmuc}
  ${list_danhmuc}  BuiltIn.Create List
  FOR    ${index}    IN    @{get_list_danhmuc}
    ${danhmuc}  SeleniumLibrary.Get Text    locator=${index}
    Append To List  ${list_danhmuc}  ${danhmuc}  
  END
  List Should Contain Value    ${list_danhmuc}    Giày - Dép nữ
  ${locator_giaydepnu}  String.Replace String  ${dynamic_xpath}  _category_name  Giày - Dép nữ
  SeleniumLibrary.Scroll Element Into View  ${locator_giaydepnu}
  SeleniumLibrary.Click Element  ${locator_giaydepnu}  
  Sleep  5s
  ${title}=  SeleniumLibrary.Get Title
  BuiltIn.Should Be Equal  ${title}  Giày - Dép nữ chính hãng, giá tốt Tháng 7, 2023 | Tiki
  ${locator_brand_findmore}  String.Replace String  ${dynamic_findmore}  desired_category  Thương hiệu
  Click Element  ${locator_brand_findmore}
  ${locator_desired_brand}  String.Replace String  ${desired_value}  _value  Biti's
  Wait Until Element Is Visible    ${locator_desired_brand}
  Click Element  ${locator_desired_brand}
  sleep  5s
  ${locator_color_findmore}  String.Replace String  ${dynamic_findmore}  desired_category  Màu sắc
  Click Element  ${locator_color_findmore}
  Sleep  5s
  ${locator_desired_color}  String.Replace String   ${desired_value}   _value  Bạc
  Wait Until Element Is Visible  ${locator_desired_color}
  Scroll Element Into View  ${locator_desired_color}
  Click Element  ${locator_desired_color}
  sleep  5s
  ${locator_size_findmore}  String.Replace String  ${dynamic_findmore}  desired_category  Kích cỡ
  Click Element  ${locator_size_findmore}
  Sleep  5s
  ${locator_desired_size}  String.Replace String   ${desired_value}   _value  36
  Wait Until Element Is Visible  ${locator_desired_size}
  Scroll Element Into View  ${locator_desired_size}
  Click Element  ${locator_desired_size}
  Sleep  10s
  ${get_text_last_item_plp}  Get Text    ${last_item_name_plp}
  Click Element    ${last_item}
  Sleep  3s
  Element Text Should Be  ${last_item_name_pdp}  ${get_text_last_item_plp}
  Sleep  5s