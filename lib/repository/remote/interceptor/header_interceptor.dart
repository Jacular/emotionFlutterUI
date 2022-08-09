import 'package:dio/dio.dart';

/// 添加通用请求头拦截器
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options,RequestInterceptorHandler handler) {
    options.headers = getHeads();
    return super.onRequest(options,handler);
  }

  /// 添加通用请求头参数 子类可以复写该方法
  Map getHeads() {
    Map<String, dynamic> map = new Map();
    map['token'] = '11';
    return map;
  }
}
