***Settings***
Library    readData.py 

***Keywords***
Read data from excel 
    [Arguments]    ${row}    ${column}
    ${data}=    get_data     ${row}     ${column}
    [Return]   ${data}

Read all data from excel
    ${list_data}=    Create List
    ${row_number}=    get_data_row_number
    ${column_number}=    get_data_column_number
    FOR   ${i}    IN RANGE    1    ${row_number}+1
        ${list}=    Create List
        FOR    ${j}    IN RANGE    1    ${column_number}+1
            ${x}=    Read data from excel    ${i}    ${j}
            Append to list    ${list}    ${x}
        END
        Append to list    ${list_data}    ${list}
    END
    Log    ${list_data}

Check log in happy case 
    [Arguments]    ${number_of_row}     
    ${username}=    Read data from excel    ${number_of_row}    ${1}
    ${Password}=    Read data from excel    ${number_of_row}    ${2}
    Input text into text box    ${username_locator}    ${username}
    Input text into text box    ${password_locator}    ${Password}
    Click on a element   ${login_btn}
    SeleniumLibrary.Wait Until Element Is Visible 	 locator=${image_logo}
    SeleniumLibrary.Element Should Be Visible 	 locator=${image_logo}

Check log in unhappy case 
    [Arguments]    ${number_of_row}     
    ${username}=    Read data from excel    ${number_of_row}    ${1}
    ${Password}=    Read data from excel    ${number_of_row}    ${2}
    Input text into text box    ${username_locator}    ${username}
    Input text into text box    ${password_locator}    ${Password}
    Click on a element   ${login_btn}
    SeleniumLibrary.Wait Until Element Is Not Visible 	 locator=${image_logo}

    



