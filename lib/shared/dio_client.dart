import 'package:dio/dio.dart';

class DioClient {
  static Dio? _dio;

  static void init() {
    _dio = Dio();
    _dio!.options.baseUrl = 'https://dummyjson.com';
    _dio!.options.connectTimeout = const Duration(seconds: 15);
    _dio!.options.receiveTimeout = const Duration(seconds: 15);
  }

  static Dio get instance {
    if (_dio == null) {
      throw Exception('DioClient must be initialized first');
    }
    return _dio!;
  }
}
