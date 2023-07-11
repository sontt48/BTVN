*** Settings ***
Resource  ${CURDIR}/../Import/Imports.robot

*** Test Cases ***
Check product in Tiki
  Open browser with Chrome  ${test_data.ULR_tiki}
  ${list}  Get all category names
  Verify that desired categoury should be in list  ${list}  ${testdata.expected_category}
  
  