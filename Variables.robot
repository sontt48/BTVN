***Variables***
${dynamic_xpath}  //a[@title="_category_name"]
${locator_danhmuc}  //div[text()='Danh mục']/parent::div/a
${tiki_logo}  //div[@class='Middle__LeftContainer-sc-vop1h1-1 hBRVdJ']//a[@data-view-id='header_main_logo']
${dynamic_findmore}  //div[@data-view-label="_desired_section"]/a[text()="Xem thêm"]
${dynamic_filter_item}  //div[@class='filter-items']/p[@class='item' and text()="_filter_name"]
${desired_value}  //span[text()="_value"]
${last_item}  (//div[@data-view-id='product_list_container']/div/a[@class='product-item'])[last()]
${last_item_name_plp}  (//div[@data-view-id='product_list_container']/div/a[@class='product-item'])[last()]//h3
${last_item_name_pdp}  //div[@class='styles__StyledProductContent-sc-1f8f774-0 ewqXRk']//h1
${expected_title}  Giày - Dép nữ chính hãng, giá tốt Tháng 7, 2023 | Tiki
${product_name_PDP_locator}    //h1[@class="title"]