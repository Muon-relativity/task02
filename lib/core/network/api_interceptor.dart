import 'package:dio/dio.dart';
import 'package:task02/core/app_exception.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Accept": "application/json",
      "Content-Type": "application/json",
    });
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response); // super 호출 대신 명시적으로 handler.next 사용
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final status = err.response?.statusCode ?? -1;
    final message = err.response?.statusMessage ?? err.message;

    // AppException 생성 및 전달
    final appError = AppException(code: status, message: message ?? 'Unknown error');

    // DioError에 AppException을 담아 재전달
    handler.reject(DioException(
      requestOptions: err.requestOptions,
      response: err.response,
      type: err.type,
      error: appError,
    ));
  }
}
