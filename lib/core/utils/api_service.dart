import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'http://localhost:8000/api/v1/';
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
