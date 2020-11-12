import 'dart:async';

import 'package:amotionflutterui/entity/menu_entity.dart';
import 'file:///F:/flutterProduct/emotionFlutterUI/lib/widget/menu.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

///场景组件
class ScenePage extends StatefulWidget {
  @override
  _ScenePageState createState() => _ScenePageState();
}

class _ScenePageState extends State<ScenePage>
    with AutomaticKeepAliveClientMixin<ScenePage> {
  List<MenuList> _menuList;

  @override
  void initState() {
    super.initState();
    _menuList=List();
    List<Menu> shopChildList=new List<Menu>();
    shopChildList.add(Menu("shopping_classify","商品分类","images/ic_product_classify.png"));
    shopChildList.add(Menu("shopping_list","商品列表","images/ic_product_classify.png"));
    shopChildList.add(Menu("shopping_detail","商品详情","images/ic_product_classify.png"));
    MenuList menuList=new MenuList("电商类效果集合", shopChildList);
    _menuList.add(menuList);

    List<Menu> chatChildList=new List<Menu>();
    chatChildList.add(Menu("chat_shard","通用分享组件","images/ic_product_classify.png"));
    chatChildList.add(Menu("chat_list","聊天效果界面","images/ic_product_classify.png"));
    MenuList menuChatChildList=new MenuList("社交类效果集合", chatChildList);
    _menuList.add(menuChatChildList);

    List<Menu> courseChildList=new List<Menu>();
    courseChildList.add(Menu("course_classify","课程分类","images/ic_product_classify.png"));
    courseChildList.add(Menu("course_duration","学习时长","images/ic_product_classify.png"));
    courseChildList.add(Menu("course_ranking","课程排行榜","images/ic_product_classify.png"));
    MenuList menuCourseList=new MenuList("教育类效果集合", courseChildList);
    _menuList.add(menuCourseList);

    List<Menu> bankChildList=new List<Menu>();
    bankChildList.add(Menu("account_list","账户总览","images/ic_product_classify.png"));
    bankChildList.add(Menu("account_qr","收款码","images/ic_product_classify.png"));
    bankChildList.add(Menu("bank_banding_list","银行卡绑定列表","images/ic_product_classify.png"));
    bankChildList.add(Menu("bank_list","银行卡列表","images/ic_product_classify.png"));
    MenuList menuBankList=new MenuList("银行类效果集合", bankChildList);
    _menuList.add(menuBankList);

    List<Menu> newsChildList=new List<Menu>();
    newsChildList.add(Menu("news_manage","频道管理","images/ic_product_classify.png"));
    newsChildList.add(Menu("news_list","新闻列表","images/ic_product_classify.png"));
    newsChildList.add(Menu("news_detail","新闻详情","images/ic_product_classify.png"));
    MenuList menuNewsList=new MenuList("新闻类效果集合", newsChildList);
    _menuList.add(menuNewsList);

    List<Menu> carChildList=new List<Menu>();
    carChildList.add(Menu("car_choice","选车效果","images/ic_product_classify.png"));
    carChildList.add(Menu("car_list","车型大全","images/ic_product_classify.png"));
    MenuList menuCarList=new MenuList("汽车类效果集合", carChildList);
    _menuList.add(menuCarList);

    List<Menu> copyChildList=new List<Menu>();
    copyChildList.add(Menu("copy_tx_series","腾讯系列","images/ic_product_classify.png"));
    copyChildList.add(Menu("copy_ali_series","阿里系列","images/ic_product_classify.png"));
    copyChildList.add(Menu("copy_bd_series","百度系列","images/ic_product_classify.png"));
    copyChildList.add(Menu("copy_tmd_series","TMD系列","images/ic_product_classify.png"));
    MenuList menCopyList=new MenuList("模仿大厂效果集合", copyChildList);
    _menuList.add(menCopyList);
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
          "场景组件",
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
      // "shopping_classify": PractitionerListPage(),
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
