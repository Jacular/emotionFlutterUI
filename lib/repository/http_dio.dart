import 'package:dio/dio.dart';
import 'remote/interceptor/dynamic_url_interceptor.dart';
import 'remote/interceptor/header_interceptor.dart';
import 'remote/interceptor/param_interceptor.dart';

class HttpDio {
  static const String BASE_URL = 'http://www.dandroid.com/api/';
  static const String webUrl = 'http://www.h5.dandroid.com/api/';

  Dio _dio;

  factory HttpDio() => _getProvider();

  HttpDio._internal();

  static HttpDio get instance => _getProvider();
  static HttpDio _httpProvider;

  static HttpDio _getProvider() {
    if (_httpProvider == null) {
      _httpProvider = new HttpDio._internal();
    }
    return _httpProvider;
  }

  ///创建dio网络请求对象
  Dio _createDio() {
    final options = BaseOptions(
        baseUrl: BASE_URL,
        connectTimeout: 30 * 1000,
        receiveTimeout: 30 * 1000);
    final dio = new Dio(options);
    // 添加通用拦截器
    for (Interceptor interceptor in getInterceptors()) {
      dio.interceptors.add(interceptor);
    }
    return dio;
  }

  // 子类可以复写该方法 自定义添加拦截器
  List<Interceptor> getInterceptors() {
    List<Interceptor> interceptors = [];
    interceptors.add(DynamicUrlInterceptor());
    interceptors.add(HeaderInterceptor());
    interceptors.add(ParamInterceptor());
    interceptors.add(LogInterceptor());
    return interceptors;
  }

  Dio getDio() {
    if (_dio == null) {
      _dio = _createDio();
    }
    return _dio;
  }
}
