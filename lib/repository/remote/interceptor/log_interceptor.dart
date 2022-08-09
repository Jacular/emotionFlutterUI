import 'package:dio/dio.dart';

/// 通用日志拦截器
class LogLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler) {
    print('HTTP请求开始: -->${options?.method} ${options?.baseUrl}${options.path}');
    if (options.headers != null) {
      print('request heads: ${options.headers.toString()}');
    }
    if (options.method == 'GET') {
      print('request params: ${options.queryParameters.toString()}');
    } else {
      print('request params: ${options.data.toString()}');
    }
    return super.onRequest(options,handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data != null) {
      print('response : ${response.data.toString()}');
    }
    print('HTTP请求结束: -->${response?.requestOptions?.method} ${response?.requestOptions?.baseUrl}${response?.requestOptions?.path}');
    return super.onResponse(response,handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        'onError errorCode: ${err?.response?.statusCode}, errorMessage: ${err?.message}');
    return super.onError(err,handler);
  }
}
