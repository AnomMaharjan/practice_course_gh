import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_hay/base%20model/base_model.dart';
import 'package:get_hay/models/Product_details_models.dart';
import 'package:get_hay/models/product.dart';

class ProductDetailsController extends BaseController {
  var count = 1.obs;

  ProductDetails productDetails;
  int from = Get.arguments["from"];

  String name = Get.arguments["data"].name;
  double offerPrice = Get.arguments["data"].offerPrice;
  double sellingPrice = Get.arguments["data"].sellingPrice;
  String description = Get.arguments["data"].description;
  int quantity = Get.arguments["data"].quantity;
  bool inStock = Get.arguments["data"].inStock;
  bool willDeliver = Get.arguments["data"].willDeliver;
  String unit = Get.arguments["data"].unit;
  String species = Get.arguments["data"].species.name;
  int id = Get.arguments["data"].id;
  String imageUrl = Get.arguments["data"].image;

  final TextEditingController quantityController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    print(id);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}
