import 'dart:async';

import 'package:amotionflutterui/entity/menu_entity.dart';
import 'package:amotionflutterui/ui/pages/dialog/dialog_page.dart';
import 'file:///F:/flutterProduct/emotionFlutterUI/lib/widget/menu.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///通用组件
class CommonPage extends StatefulWidget {
  @override
  _CommonPageState createState() => _CommonPageState();
}

class _CommonPageState extends State<CommonPage>
    with AutomaticKeepAliveClientMixin<CommonPage> {
  List<MenuList> _menuList;

  @override
  void initState() {
    super.initState();
    _menuList=List();
    List<Menu> otherChildList=new List<Menu>();
    otherChildList.add(Menu("shopping_classify","启动样式","images/ic_product_classify.png"));
    otherChildList.add(Menu("shopping_list","登录注册","images/ic_product_classify.png"));
    otherChildList.add(Menu("shopping_list","修改密码","images/ic_product_classify.png"));
    otherChildList.add(Menu("shopping_list","忘记密码","images/ic_product_classify.png"));
    otherChildList.add(Menu("shopping_list","用户协议","images/ic_product_classify.png"));
    MenuList menuOtherList=new MenuList("额外组件", otherChildList);
    _menuList.add(menuOtherList);

    List<Menu> shopChildList=new List<Menu>();
    shopChildList.add(Menu("shopping_classify","toast","images/ic_product_classify.png"));
    shopChildList.add(Menu("shopping_list","Progressbar","images/ic_product_classify.png"));
    MenuList menuShopList=new MenuList("消息类", shopChildList);
    _menuList.add(menuShopList);

    List<Menu> chatChildList=new List<Menu>();
    chatChildList.add(Menu("chat_shard","空数据","images/ic_product_classify.png"));
    chatChildList.add(Menu("chat_list","错误页面","images/ic_product_classify.png"));
    chatChildList.add(Menu("chat_list","网络请求失败提示","images/ic_product_classify.png"));
    MenuList menuChatChildList=new MenuList("情感化", chatChildList);
    _menuList.add(menuChatChildList);

    List<Menu> courseChildList=new List<Menu>();
    courseChildList.add(Menu("course_classify","城市选择","images/ic_product_classify.png"));
    courseChildList.add(Menu("course_duration","商品筛选","images/ic_product_classify.png"));
    courseChildList.add(Menu("course_ranking","下来筛选","images/ic_product_classify.png"));
    courseChildList.add(Menu("course_ranking","时间选择","images/ic_product_classify.png"));
    MenuList menuCourseList=new MenuList("行动类", courseChildList);
    _menuList.add(menuCourseList);

    List<Menu> bankChildList=new List<Menu>();
    bankChildList.add(Menu("dialog_list","dialog","images/ic_product_classify.png"));
    bankChildList.add(Menu("account_qr","Popup","images/ic_product_classify.png"));
    MenuList menuBankList=new MenuList("弹框", bankChildList);
    _menuList.add(menuBankList);

    List<Menu> newsChildList=new List<Menu>();
    newsChildList.add(Menu("news_manage","车牌输入","images/ic_product_classify.png"));
    newsChildList.add(Menu("news_list","价格输入","images/ic_product_classify.png"));
    newsChildList.add(Menu("news_detail","支付输入","images/ic_product_classify.png"));
    MenuList menuNewsList=new MenuList("键盘类", newsChildList);
    _menuList.add(menuNewsList);

    List<Menu> carChildList=new List<Menu>();
    carChildList.add(Menu("car_choice","文本输入样式","images/ic_product_classify.png"));
    carChildList.add(Menu("car_list","排版","images/ic_product_classify.png"));
    carChildList.add(Menu("car_list","按钮样式","images/ic_product_classify.png"));
    MenuList menuCarList=new MenuList("表单类", carChildList);

    _menuList.add(menuCarList);
    List<Menu> menuChildList=new List<Menu>();
    menuChildList.add(Menu("car_choice","网格菜单","images/ic_product_classify.png"));
    menuChildList.add(Menu("car_list","分段菜单","images/ic_product_classify.png"));
    MenuList menuList=new MenuList("菜单", menuChildList);
    _menuList.add(menuList);

    List<Menu> barChildList=new List<Menu>();
    barChildList.add(Menu("car_choice","appbar","images/ic_product_classify.png"));
    barChildList.add(Menu("car_list","bottombar","images/ic_product_classify.png"));
    MenuList menuBarList=new MenuList("导航类", barChildList);
    _menuList.add(menuBarList);

    List<Menu> listChildList=new List<Menu>();
    listChildList.add(Menu("car_choice","上下刷新","images/ic_product_classify.png"));
    listChildList.add(Menu("car_list","固定Header","images/ic_product_classify.png"));
    MenuList menuListList=new MenuList("列表", listChildList);
    _menuList.add(menuListList);

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.light,
        title: Text(
          "通用组件",
          style: TextStyle(
            fontSize: Adapt.px(25),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _menuList == null
        ? Container()
        : ListView.builder(
          itemCount: _menuList.length,
          itemBuilder: (context, index) => MenuWidget(
            menuList: _menuList[index],
            itemClick: (menu) async {
              menuRouter(menu.menus);
            },
          ),
        ),
    );
  }

  void menuRouter(String menu) {
    final Map<String, Widget> menuWidgets = {
       "dialog_list": DialogPage(),
      // "shopping_list": WebViewH5Page(url: H5_URL_THIRD, title: "emotion"),
      // "shopping_detail": TicketPage()
    };
    if(menuWidgets[menu] == null){
      Fluttertoast.showToast(msg: "正在加紧开发中...");
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => menuWidgets[menu])
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
