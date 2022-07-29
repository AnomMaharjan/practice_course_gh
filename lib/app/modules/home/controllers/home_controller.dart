import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_hay/api/product.dart';

class HomeController extends GetxController {
  var isSelected = false.obs;
  var appBarTitle = 'Home'.obs;

  final currentIndex = 0.obs;
  final colorOne = Colors.red[800].obs;
  final colorTwo = Colors.grey.shade400.obs;

  final count = 0.obs;
  final productAPI = ProductAPI();

  var products = [].obs;
  var productAvailable = false.obs;

  var wishListIcon = [].obs;

  setBottomBarIndex(index, title) {
    print(index);
    print(title);
    currentIndex.value = index;
    appBarTitle.value = title;
    update();
  }

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() {
    this.productAPI.getProducts().then((products) {
      print(products);
      this.products.assignAll(products);
      productAvailable.value = products != null;
    });


  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
