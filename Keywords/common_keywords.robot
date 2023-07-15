***Keywords***

Click on a element 
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible 	 locator=${locator}
    SeleniumLibrary.Click Element 	 locator=${locator}