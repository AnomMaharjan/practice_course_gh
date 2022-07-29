import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_hay/app/modules/MyProducts/views/my_products_view.dart';
import 'package:get_hay/app/modules/Wishlist/controllers/wishlist_controller.dart';
import 'package:get_hay/app/routes/app_pages.dart';
import 'package:get_hay/models/product.dart';
import 'package:get_hay/widget/widdgetpage.dart';

class PopularWidgetView extends GetView {
  final Product product;

  PopularWidgetView({this.product, IconButton favoriteIcon});

  final WishlistController wishListController = Get.put(WishlistController());
  var isAdded = false.obs;

  @override
  Widget build(BuildContext context) {
    isAdded.value = product.isAdded;
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS, arguments: {
          "from": 0,
          "data": product,
        });
      },
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Container(
            width: 156,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(right: 4.0, top: 10, bottom: 10, left: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    offset: Offset(0, 0),
                    blurRadius: 3,
                    spreadRadius: 1,
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => isAdded.value == false
                    ? IconButton(
                        splashRadius: 3,
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.favorite_border,
                          size: 18,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          print("product id${product.id}");
                          bool success = await wishListController
                              .addToWishList(product.id);
                          if (success) {
                            product.isAdded = true;
                            isAdded.value = product.isAdded;
                          }
                        },
                      )
                    : IconButton(
                        splashRadius: 3,
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.all(0),
                        icon: Icon(
                          Icons.favorite,
                          size: 18,
                          color: Colors.red,
                        ),
                        onPressed: () async {
                          print("product id${product.id}");
                          bool success = await wishListController
                              .deleteWishList(product.id);
                          if (success) {
                            product.isAdded = true;
                            isAdded.value = product.isAdded;
                          }
                        },
                      )),
                gap(15, 0),
                Center(
                  child: imageContainer(product.image, product),
                ),
                gap(10, 0),
                Center(
                  child: Text(
                    product.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                  ),
                ),
                gap(2, 0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$${product.offerPrice.toString()}",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 16, color: Colors.red[400]),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      product.offerPrice >= product.sellingPrice
                          ? SizedBox()
                          : Text(
                              "\$${product.sellingPrice.toString()}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red[400],
                                  decoration: TextDecoration.lineThrough),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
