import 'package:dio/dio.dart';
import 'package:amotionflutterui/repository/remote/base_result.dart';


/// 父类repository对象
class BaseRepository {
  Dio _dio;
  BaseRepository();

  void setDio(Dio dio){
    this._dio = dio;
  }

  /// 通用get请求
  Future<dynamic> get(String path, {Map<String, dynamic> params}) async {
    try {
      Response response = await _dio.get(path, queryParameters: params);
      return BaseResult(
          data: response.data,
          code: response.statusCode,
          message: response.statusMessage);
    } catch (e) {
      print('异常信息：' + e.toString());
      return BaseResult(message: e.toString(), code: 500);
    }
  }

  /// 通用post请求
  Future<dynamic> post(String path, Map<String, dynamic> params) async {
    try {
      Response response = await _dio.post(path, data: params);
      return BaseResult(
          data: response.data,
          code: response.statusCode,
          message: response.statusMessage);
    } catch (e) {
      print('异常信息：' + e.toString());
      return BaseResult(message: e.toString(), code: 500);
    }
  }
}
