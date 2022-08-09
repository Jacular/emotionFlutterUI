import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:amotionflutterui/color/color.dart';
import 'package:amotionflutterui/data/home_data_json.dart';
import 'package:amotionflutterui/model/Icon_item.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'nav_menu_item.dart';

class CarLifePage extends StatefulWidget {
  @override
  _CarLifePageState createState() => _CarLifePageState();
}

class _CarLifePageState extends State<CarLifePage> {
  ScrollController _scrollController = ScrollController();
  List<IconItem> list = [];
  List<IconItem> navBodyMenus = navBodyMenuItem;

  @override
  void initState() {
    super.initState();
    list = navLifeMenuItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   brightness: Brightness.light,
      //   title: Text(
      //     "团油",
      //     style: TextStyle(
      //       fontSize:20,
      //     ),
      //   ),
      //   backgroundColor: colorF0F0F0,
      //   elevation: 0,
      // ),
      backgroundColor: colorF6F6F6,
      body: Container(
        color: colorE5E5E5,
        child: ListView(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),//允许滚动超出边界，但之后内容会反弹回来
          children: <Widget>[
            Stack(
              //类似RelativeLayout
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(color: colorPrimary),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 8.0,
                      ),
                      TextButton(
                        child: Text(
                          '添加爱车',
                          style: TextStyle(color: color333333),
                        ),
                        onPressed: () {
                          Fluttertoast.showToast(msg: "添加爱车");
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          padding: MaterialStateProperty.all(EdgeInsets.only(
                              left: 48, right: 48, top: 18, bottom: 18)),
                          shape: MaterialStateProperty.all(
                              StadiumBorder()), //两端是半圆的边框
                        ),
                      )
                    ],
                  ),
                ),

                /// 菜单
                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 8, right: 8, top: 80),
                  decoration: BoxDecoration(
                    //实现边框
                    color: colorFFFFFF,
                    borderRadius: BorderRadius.circular(8), //边框的角度
                  ),
                  child: GridView.count(
                    crossAxisCount:list.length, //横轴三个子widget
                    childAspectRatio: 1.0, //宽高比
                    ///List.generate生成widget
                    children: List.generate(
                        list.length,
                        (index) =>
                            NavMenuItem(iconItem: list[index], onTap: () {})),
                  ),
                ),
              ],
            ),

            /// 轮播
            Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 8),
              decoration: BoxDecoration(
                //实现边框
                color: colorFFFFFF,
                borderRadius: BorderRadius.circular(10), //边框的角度
              ),
              child: BannerView(
                _buildBanner(),
                intervalDuration: Duration(milliseconds: 3500),
                indicatorSelected:
                    _buildIndicatorItem(color5FC48D, color5FC48D),
                indicatorNormal:
                    _buildIndicatorItem(colorFFFFFF, Colors.grey[300]),
                indicatorBuilder: _buildIndicator,
                log: false,
              ),
              height: 100,
            ),

            GridView.builder(
              shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5, //每行三列
                    childAspectRatio: 1.0 //显示区域宽高相等
                    ),
                itemCount: navBodyMenus.length,
                itemBuilder: (context, index) {
                  return NavMenuItem(iconItem: navBodyMenus[index], onTap: () {});
                })
          ],
        ),
      ),
    );
  }

  //广告位
  List<Widget> _buildBanner() {
    print(MediaQuery.of(context).size.width);
    return homeBanners
        .map((String item) => Image(
              fit: BoxFit.fitWidth,
              image: NetworkImage(item),
              width: MediaQuery.of(context).size.width,
            ))
        .toList();
  }

  //指示器
  Widget _buildIndicatorItem(Color color, Color bdColor) {
    return Container(
      width: 5,
      height: 5,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: bdColor)),
    );
  }

  Widget _buildIndicator(BuildContext context, Widget indicator) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 20.0,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            new Align(
              alignment: Alignment.center,
              child: indicator,
            ),
          ],
        ),
      ),
    );
  }
}
