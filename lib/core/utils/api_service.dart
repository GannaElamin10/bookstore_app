import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = '10.0.2.2:8000';
  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get(
      '$_baseUrl$endPoint',
      options: Options(headers: {'Authorization': 'Bearer YOUR_TOKEN'}),
    );

    return response.data;
  }
}
