
***Variables***
&{dict_homepage}
...    noi_bat=xpath=//div[text()='Danh mục']/parent::div/a
...    tiki_logo=xpath=//div[@class='Middle__LeftContainer-sc-vop1h1-1 hBRVdJ']//a[@data-view-id='header_main_logo']


***Keywords***
Verify logo should be displayed on hompage 
    SeleniumLibrary.Wait Until Element Is Visible 	 ${dict_homepage.tiki_logo}
