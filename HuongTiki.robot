*** Settings ***
Library        SeleniumLibrary
Library    String
Library    Collections


*** Variables ***
${title}     //div[contains(@title,'_category_name')]


*** Test Cases ***
Dynamic 
    Open Browser    https://tiki.vn/     Chrome
    Maximize Browser Window
    ${locator} =     Replace String    ${title}    _category_name    Mua trước trả sau
    ${locator1} =     Replace String    ${title}    _category_name    Giá Rẻ Mỗi Ngày
    
    Click Element    ${locator1}