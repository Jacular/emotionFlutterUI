

import 'package:amotionflutterui/view_model/base_view_model.dart';
import 'package:amotionflutterui/view_model/home/home_respository.dart';

/// 首页ViewModel
class HomeViewModel extends BaseViewModel<HomeRepository> {
  /// 首页相关的充电桩
  Future<dynamic> getHomeStationList({int start, int count}) async {
    var result = await mRepository.getHomeStationList(start: start, count: count);
    if (result != null && result.data != null) {
      return result.data['subjects'];
    } else {
      return null;
    }
  }

  @override
  HomeRepository createRepository() {
    return new HomeRepository();
  }
}
