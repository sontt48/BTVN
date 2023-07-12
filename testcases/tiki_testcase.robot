*** Settings ***
Resource   ${CURDIR}/../Import/Import_desktop.robot

*** Test Cases ***
Open Tiki
  [Tags]  tiki
  Open Browser with Chrome     ${test_data.URL_tiki}

Check product on Tiki
  ${list} =  Get all categories names  
  Verify that desired category should be in category list    ${list}   ${testdata.expected_category}


# Lấy các danh mục bên dưới phần "Nổi bật" , xác nhận xem có mục Xả kho ở trong đó
#   ${list_noibat} =  Get value noi bat names
#   Verify that desired category should be in category list    ${list_noibat}   ${expected_noibat}

  # python -m robot -d results  testcases\tiki_testcase.robot