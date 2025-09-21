import 'package:dio/dio.dart';
import 'api_interceptor.dart';

class DioClient {
  final Dio dio;

  DioClient(String baseUrl) : dio = Dio(BaseOptions(baseUrl: baseUrl, connectTimeout: const Duration(seconds: 10))) {
    dio.interceptors.add(ApiInterceptor());
  }
}
