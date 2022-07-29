import 'package:dio/dio.dart';
import 'package:get_hay/models/product.dart';
import 'package:get_hay/utils/dio_logging_interceptors.dart';

class ProductAPI {
  final Dio _dio = new Dio();
  final String _baseUrl = 'http://119.8.174.175';

  ProductAPI() {
    _dio.options.baseUrl = _baseUrl;
    _dio.interceptors.add(DioLoggingInterceptors());
  }

  Future<List<Product>> getProducts() async {
    final String apiUrl = '/api/products/';
    try {
      print('getwishlist');
      final response = await _dio.get(
        apiUrl,
        options: Options(
          headers: {
            'requirestoken': true,
          },
        ),
      );

      if (response.statusCode == 200) {
        print('Data recieved');
        return Product.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print('Product API Error');
      print(error);
    }
    return null;
  }
}
