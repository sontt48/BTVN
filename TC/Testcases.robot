*** Settings ***
Resource  ${CURDIR}/../Import/Imports.robot

*** Test Cases ***
Check product in Tiki
  Open browser with Chrome  ${test_data.ULR_tiki}
  ${list}  Get all category names  ${testdata.section_name}
  Verify that desired categoury should be in list  ${list}  ${testdata.expected_category}
  Click on desired category    ${testdata.clicked_cate}
  Verify that title should be equal   ${testdata.expired_text}
  Click on desired options    ${testdata.brand_section}  ${testdata.brand_option}
  Click on desired options    ${testdata.color_section}  ${testdata.color_option}
  Click on desired options    ${testdata.size_section}  ${testdata.size_option}
  ${list_PLP}=  Get name, brand, color of the last product in PLP  ${testdata.brand_option}  ${testdata.size_option}
  ${list_PDP}=  Get name, brand, color of the last product in PDP
  Dictionaries Should Be Equal  ${list_PDP}  ${list_PLP}