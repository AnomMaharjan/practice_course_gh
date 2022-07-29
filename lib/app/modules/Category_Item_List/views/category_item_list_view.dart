import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/All_CatergoryList/views/all_catergory_list_view.dart';
import 'package:get_hay/app/modules/Popular_CategoryList/views/popular_category_list_view.dart';
import 'package:get_hay/app/modules/Stock_CategoryList/views/stock_category_list_view.dart';
import 'package:get_hay/app/modules/home/controllers/home_controller.dart';

import '../controllers/category_item_list_controller.dart';

class CategoryItemListView extends GetView<CategoryItemListController> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
          child: Column(children: [
            inputSearch(),
            PopularCategoryListView(),
            SizedBox(
              height: 10,
            ),
            StockCategoryListView(),
            SizedBox(
              height: 10,
            ),
            AllCatergoryListView(),
          ]),
        ),
      ),
    );
  }
}

inputSearch() {
  return Row(
    children: [
      Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 4),
          margin: EdgeInsets.only(left: 18, right: 18, top: 0, bottom: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(38),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: Offset(0, 0),
                  blurRadius: 3,
                  spreadRadius: 1,
                )
              ]),
          child: TextFormField(
            autofocus: false,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.lightBlueAccent,
              suffixIcon: Icon(
                Icons.search,
                color: Colors.red,
              ),
              hintText: 'Search',
            ),
          ),
        ),
      ),
    ],
  );
}
