***Keywords***

Click on a element 
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible 	 locator=${locator}
    SeleniumLibrary.Click Element 	 locator=${locator}

Input text into text box
    [Arguments]    ${locator}
    SeleniumLibrary.Wait Until Element Is Visible 	 locator=${locator}
    SeleniumLibrary.Input Text 	 locator=${locator}

Open Browser with Chrome
  [Arguments]  ${URL}
  Open Browser  ${URL}  Chrome
  Maximize Browser Window