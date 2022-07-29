import 'package:dio/dio.dart';
import 'package:get_hay/models/wishlist.dart';

class WishlistAPI {
  final Dio _dio = new Dio();
  final String _baseUrl = 'http://119.8.174.175';

  WishlistAPI() {
    _dio.options.baseUrl = _baseUrl;
  }

  Future<List<WishlistProduct>> getWishListProducts() async {
    final String apiUrl = '/api/wishlists/';
    try {
      final response = await this._dio.get(apiUrl);

      if (response.statusCode == 200) {
        print('Data recieved');
        return WishlistProduct.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Wishlist API Error');
      print(error);
    }
    return null;
  }
}
