import 'package:dio/dio.dart';
import 'package:get_hay/const.dart';
import 'package:get_hay/models/profile.dart';

class ProfileAPI {
  final Dio _dio = Dio();
  final String _baseUrl = BASE_API_URL;

  ProfileAPI() {
    _dio.options.baseUrl = _baseUrl;
  }

  Future<List<Profile>> getProfile() async {
    final String apiUrl = "/api/profile/";
    try {
      final response = await this._dio.get(apiUrl);

      if (response.statusCode == 200) {
        print('Data received');
        return Profile.mapArray(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
        throw response.statusCode;
      }
    } catch (error) {
      print(error);
    }
    return null;
  }
}
