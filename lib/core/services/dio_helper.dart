import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;


  static const String baseUrl = "http://10.0.2.2:8000/api/v1/";
  static String? token;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
  }

  static void _setHeaders() {
    dio!.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    _setHeaders();
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? data,
  }) async {
    _setHeaders();
    return await dio!.post(url, data: data);
  }


  static Future<Response> searchData({
    required String query,
  }) async {
    _setHeaders();
    return await dio!.get(
      'search',
      queryParameters: {
        'query': query,
      },
    );
  }

 
  static Future<Response> filterData({
    required Map<String, dynamic> filters,
  }) async {
    _setHeaders();
    return await dio!.get(
      'filter', //      
      queryParameters: filters,
    );
  }
}
