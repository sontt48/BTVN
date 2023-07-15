*** Variables ***
${dynamic_category_list}  //div[text()="_section_name"]/parent::div//a
${dynamic_category}  //a[@title="_category_name"]
${dynamic_findmore}  //div[@data-view-label="_category_name"]/a[text()="Xem thêm"]
${dynamic_option}  //span[text()="_option_name"]
${last_item_PLP}  (//div[@data-view-id="product_list_container"]/div/a)[last()]//h3
${last_item_PDP}  //div[@class='styles__StyledProductContent-sc-1f8f774-0 ewqXRk']//h1
