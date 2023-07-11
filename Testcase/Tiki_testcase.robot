***Settings***
Resource  ${CURDIR}/../Import/Import_desktop.robot


***Test Cases***
TC1 Check product on TiKi
  open browser with Chrome   ${test_data.URL_tiki}

TC2 check product on Tiki 
  ${list} =   Get list   ${locator_danhmuc}
  Verify that desired category should be in category list  ${list}  ${expected_category}

TC3 Lấy các danh mục bên dưới phần "Nổi bật" , xác nhận xem có mục Xả kho ở trong đó
  ${list} =  Get list  ${locator_noibat}
  Verify that desired category should be in category list  ${list}  ${expected_noibat}

  
#python -m robot -d results  Testcase\Tiki_testcase.robot 