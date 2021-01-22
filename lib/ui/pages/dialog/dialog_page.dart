import 'package:amotionflutterui/entity/menu_entity.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:amotionflutterui/widget/dialog/common_dialogs.dart';
import 'package:amotionflutterui/widget/menu.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///弹框
class DialogPage extends StatefulWidget {
  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  List<MenuList> _menuList;
  @override
  void initState() {
    super.initState();
    List<Menu> otherChildList=new List<Menu>();
    otherChildList.add(Menu("001","普通弹框","images/ic_product_classify.png"));
    otherChildList.add(Menu("002","带输入框弹框","images/ic_product_classify.png"));
    otherChildList.add(Menu("003","二维码","images/ic_product_classify.png"));

    MenuList menuOtherList=new MenuList("dialog", otherChildList);
    _menuList.add(menuOtherList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "弹框效果",
          style: TextStyle(
            fontSize: Adapt.px(25),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: _menuList.length,
        itemBuilder: (context, index) => MenuWidget(
          menuList: _menuList[index],
          itemClick: (menu) async {
            menuRouter(menu.menus);
          },
        ) ,
      ),
    );
  }
  void menuRouter(String menu) {
    switch(menu){
      case "001":
        _showConfirmDialog(1);
        break;
      case "002":
        _showConfirmDialog(0);
        break;
    }

  }
  /// 0有输入框，1不带输入框
  void _showConfirmDialog(int isFetch) {
    showTipsDialog(
      context,
      titleText: "提示",
      contentText: "我是弹框，参数传0可以有输入框哦！",
      isEditable: isFetch==0,
      editHintText: "请输入内容（可选）",
      onEditValue: (editString) {
        // 请求成功
        Navigator.pop(context,true);
        return true;
      },
    );
  }
}
