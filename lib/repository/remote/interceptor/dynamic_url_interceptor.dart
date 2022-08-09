import 'package:dio/dio.dart';

/// 添加通用动态修改baseUrl的拦截器
class DynamicUrlInterceptor extends InterceptorsWrapper {
  static const String BASE_URL = 'http://www.dandroid.com/api/';

  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler) {
    options.baseUrl = getBaseUrl();
    return super.onRequest(options, handler);
  }

  String getBaseUrl() {
    return BASE_URL;
  }
}
