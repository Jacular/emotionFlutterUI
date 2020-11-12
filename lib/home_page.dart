
import 'package:amotionflutterui/ui/common/common_page.dart';
import 'package:amotionflutterui/ui/scene/scene_page.dart';
import 'package:amotionflutterui/ui/we/we_page.dart';
import 'package:amotionflutterui/widget/home_bottom_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  TabController _tabController;
  int _selectedTab = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: <Widget>[
                  ScenePage(),
                  CommonPage(),
                  WePage(),
                ],
              ),
            ),
            HomeBottomBar(
              selectedTab: _selectedTab,
              onTabChanged: (selectedTab) {
                  setState(() {
                    _selectedTab = selectedTab;
                    _tabController.index = _selectedTab;
                  });
              },
            )
          ],
      ),
    );
  }
}