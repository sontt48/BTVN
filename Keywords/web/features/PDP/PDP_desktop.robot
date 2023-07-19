***Keywords***

Verify product name is correctly at PDP 
  [Arguments]    ${product_name_PLP}
  SeleniumLibrary.Wait Until Element Is Visible 	 ${product_name_PDP_locator} 
  ${product_name_PDP}=    SeleniumLibrary.Get Text 	 ${product_name_PDP_locator} 
  Should Be Equal As Strings    ${product_name_PLP}    ${product_name_PDP}