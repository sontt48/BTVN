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

