import 'dart:convert';

import 'package:banner_view/banner_view.dart';
import 'package:flutter/material.dart';
import 'package:amotionflutterui/color/color.dart';
import 'package:amotionflutterui/data/home_data_json.dart';
import 'package:amotionflutterui/model/station_info.dart';
import 'package:amotionflutterui/ui/home/widget/home_bar.dart';
import 'package:amotionflutterui/ui/home/widget/nav_view.dart';
import 'package:amotionflutterui/ui/home/widget/recommend_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  StationInfo stationInfo = StationInfo();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  //传两个数据进去
  List<Widget> _buildIconNav() {
    List<Widget> containers = [];
    containers.add(NavView(
      list: navItem.sublist(0, 5),
    ));
    containers.add(NavView(
      list: navItem.sublist(5,navItem.length),
    ));
    return containers;
  }

  @override
  void dispose() {
    super.dispose();
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
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Stack(//类似RelativeLayout
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  decoration: BoxDecoration(color: colorPrimary),
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 8.0,),
                      HomeBar(
                        height: 45,
                        slided: false,
                        showInput: true,
                        bgColor: color999999,
                        fontColor: colorFFFFFF,
                        fillColor: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
                /// 导航图标
                Container(
                  height: 100,
                  margin: EdgeInsets.only(left: 8, right: 8,top: 60),
                  decoration: BoxDecoration(
                    //实现边框
                    color: colorFFFFFF,
                    borderRadius: BorderRadius.circular(5), //边框的角度
                  ),
                  child: BannerView(
                    _buildIconNav(),
                    autoRolling: false,
                    indicatorSelected:
                    _buildIndicatorItem(color5FC48D, color5FC48D),
                    indicatorNormal:
                    _buildIndicatorItem(colorFFFFFF, Colors.grey[300]),
                    indicatorBuilder: _buildIndiator,
                    log: false,
                  ),
                ),

              ],
            ),
            /// 轮播
            Container(
              margin: EdgeInsets.only(left: 8, right: 8,top: 10,bottom: 8),
              decoration: BoxDecoration(
                //实现边框
                color: colorFFFFFF,
                borderRadius: BorderRadius.circular(10), //边框的角度
              ),
              child:BannerView(
                _buildBanner(),
                intervalDuration: Duration(milliseconds: 3500),
                indicatorSelected:
                _buildIndicatorItem(color5FC48D, color5FC48D),
                indicatorNormal:
                _buildIndicatorItem(colorFFFFFF, Colors.grey[300]),
                indicatorBuilder: _buildIndiator,
                log: false,
              ),
              height: 100,
            ),

            /// 列表
            RecommendList(
              data: stationInfo,
              itemClick: (stationInfoItem) {
                Fluttertoast.showToast(msg: "" + stationInfoItem.address);
              },
            )
          ],
        ),
      ),
    );
  }

  _loadData() {
    Future<String> loadString =
        DefaultAssetBundle.of(context).loadString("image/station.json");
    loadString.then((String result) {
      // pulled = false;
      stationInfo = StationInfo.fromJson(jsonDecode(result));

      setState(() {});
    });
  }

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

  Widget _buildIndiator(BuildContext context, Widget indicator) {
    Widget container = Container(
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
    );
    return Align(
      alignment: Alignment.bottomCenter,
      child: container,
    );
  }
}
