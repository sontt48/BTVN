*** Settings ***
Resource  ${CURDIR}/../Import/Imports.robot

*** Test Cases ***
Check product in Tiki
  Open browser with Chrome  ${test_data.ULR_tiki}
  ${list}  Get all category names  ${testdata.section_name}
  Verify that desired categoury should be in list  ${list}  ${testdata.expected_category}
  Click on desired category    ${testdata.clicked_cate}
  Verify that title should be equal   ${testdata.expired_text}
  Wait Until Keyword Succeeds    3x    1s   Click on desired options    ${testdata.brand_section}  ${testdata.brand_option}
  Wait Until Keyword Succeeds    3x    1s   Click on desired options    ${testdata.color_section}  ${testdata.color_option}
  Wait Until Keyword Succeeds    3x    1s   Click on desired options    ${testdata.size_section}  ${testdata.size_option}
  Verify that names in 2 pages should be the same
