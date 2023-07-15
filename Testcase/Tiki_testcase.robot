***Settings***
Resource  ${CURDIR}/../Import/Import_desktop.robot


***Test Cases***
TC1 Check product on TiKi
  open browser with Chrome   ${test_data.URL_tiki}

  # step check product on Tiki 
  ${list} =   Get list   ${locator_danhmuc}
  Verify that desired category should be in category list  ${list}  ${expected_category}

  #Click vào danh mục "Giày - Dép nữ", xác nhận rằng page mới có title là "Giày - Dép nữ chính hãng, giá tốt Tháng 7, 2023 | Tiki"
  Click on category names    ${expected_category}
  Verify title should be equa   ${expected_title}

  #step Lấy các danh mục bên dưới phần "Nổi bật" , xác nhận xem có mục Xả kho ở trong đó
  open browser with Chrome   ${test_data.URL_tiki}
  ${list} =  Get list  ${locator_noibat}
  Verify that desired category should be in category list  ${list}  ${expected_noibat}


# python -m robot -d results  Testcase\Tiki_testcase.robot 
  
