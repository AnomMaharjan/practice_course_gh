
import 'package:dio/dio.dart';
import 'package:get_hay/injector/injector.dart';
import 'package:get_hay/storage/sharedprefences/shared_preferences_manager.dart';


class DioLoggingInterceptors extends InterceptorsWrapper {

  
  final SharedPreferencesManager _sharedPreferencesManager = locator<
      SharedPreferencesManager>();

  
  @override
  Future onRequest(RequestOptions options) async {
    print("--> ${options.method != null
        ? options.method.toUpperCase()
        : 'METHOD'} ${"" + (options.baseUrl ?? "") + (options.path ?? "")}");
    print("Headers:");
    options.headers.forEach((k, v) => print('$k: $v'));
    if (options.queryParameters != null) {
      print("queryParameters:");
      options.queryParameters.forEach((k, v) => print('$k: $v'));
    }
    if (options.data != null) {
      print("Body: ${options.data}");
    }
    print("--> END ${options.method != null
        ? options.method.toUpperCase()
        : 'METHOD'}");

    if (options.headers.containsKey('requirestoken')) {
      options.headers.remove('requirestoken');
      print('accessToken: ${_sharedPreferencesManager.getString(
          SharedPreferencesManager.keyAccessToken)}');
      String accessToken = _sharedPreferencesManager.getString(
          SharedPreferencesManager.keyAccessToken);
      options.headers.addAll({'Authorization': 'Token $accessToken'});
    }
    return options;
  }

  @override
  Future onResponse(Response response) {
    print(
        "<-- ${response.statusCode} ${(response.request != null ? (response
            .request.baseUrl + response.request.path) : 'URL')}");
    print("Headers:");
    response.headers?.forEach((k, v) => print('$k: $v'));
    print("Response: ${response.data}");
    print("<-- END HTTP");
    return super.onResponse(response);
  }

}