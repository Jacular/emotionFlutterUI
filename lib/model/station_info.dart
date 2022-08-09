class StationInfoItem {
  String id;

  /// 标题
  String title;

  /// 售价
  num price;

  /// 新车价
  num newPrice;

  /// 地址
  String address;

  ///行驶里程
  num travel;

  ///图片
  String pic;

  StationInfoItem(
      {this.id,
      this.price,
      this.newPrice,
      this.address,
      this.travel,
      this.title,
      this.pic});

  StationInfoItem.fromJson(Map json) {
    this.id = json["id"];
    this.price = num.tryParse(json["price"]);
    this.newPrice = num.tryParse(json["newPrice"]);
    this.address = json["address"];
    this.travel = num.tryParse(json["travel"]);
    this.title = json["title"];
    this.pic =json["pic"];
  }
}

class StationInfo {
  int code;
  List<StationInfoItem> data;

  StationInfo({this.code = 0, this.data});

  StationInfo.fromJson(Map json) {
    List<StationInfoItem> items = [];
    code = json["code"] ?? -1;
    if (json["data"] != null) {
      json['data']
          .map((item) => {items.add(StationInfoItem.fromJson(item))})
          .toList();
    }
    this.data = items;
  }
}
