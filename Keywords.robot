***Settings***
Library  SeleniumLibrary
Library  String
Library  Collections
Resource  ${CURDIR}/Variables.robot


***Keywords***
 
Open Browser with Chrome
  [Arguments]  ${URL}
  Open Browser  ${URL}  Chrome
  Maximize Browser Window

  
Get all categories names 
    ${section_name}     String.Replace String 	 ${dynamic_category_list}  _section_name Nổi bật
    ${category_list}    Get WebElement 	  ${section_name}
    ${list}  BuiltIn.Creat List
  FOR    ${index}    IN    @{category_list}
    ${get_text}   Get Text    ${index}
    Append To List   ${list}    ${get_text}
  END
  [Return]  ${get_text}

  
Verify that desired category should be in category list 
  [Arguments]  ${list}  ${desired_category}
  List Should Contain Value  ${list}  ${desired_category}

  

