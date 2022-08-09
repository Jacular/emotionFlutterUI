

import 'package:dio/dio.dart';
import 'package:amotionflutterui/data/api_service.dart';
import 'package:amotionflutterui/repository/http_dio.dart';
import 'package:amotionflutterui/repository/remote/base_repository.dart';

/// 首页相关的接口
class HomeRepository extends BaseRepository {
  Dio dio = HttpDio.instance.getDio();

  HomeRepository() {
    setDio(dio);
  }
  /// 获取所有车站
  Future<dynamic> getHomeStationList({int start, int count}) async {
    var result = await get(ApiService.getHomeStationList(),
        params: {'start': start, 'count': count});
    return result;
  }

}
