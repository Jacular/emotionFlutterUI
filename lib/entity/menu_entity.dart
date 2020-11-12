class MenuList {
  String name;
  List<Menu> childs;
  String assetName;

  MenuList(
    this.name,
    this.childs,
  );

  MenuList.fromJson(Map<String, dynamic> json) {
    if (json['childs'] != null) {
      childs = new List<Menu>();
      json['childs'].forEach((v) {
        childs.add(new Menu.fromJson(v));
      });
    }
    assetName = json['assetName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.childs != null) {
      data['childs'] = this.childs.map((v) => v.toJson()).toList();
    }
    data['assetName'] = this.assetName;
    data['name'] = this.name;
    return data;
  }
}

class Menu {
  String menus;
  String name;
  String assetName;
  Menu(
    this.menus,
    this.name,
    this.assetName,
  );
  Menu.fromJson(Map<String, dynamic> json) {
    menus = json['menus'];
    assetName = json['assetName'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menus'] = this.menus;
    data['assetName'] = this.assetName;
    data['name'] = this.name;
    return data;
  }
}
