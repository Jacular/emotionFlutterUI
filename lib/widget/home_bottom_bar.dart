import 'package:amotionflutterui/color/color.dart';
import 'package:flutter/material.dart';

class HomeBottomBar extends StatelessWidget {
  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  HomeBottomBar({@required this.selectedTab, @required this.onTabChanged});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: colorBEC1C7,
        selectedItemColor: colorPrimary,
        currentIndex: selectedTab,
        onTap: (index) => onTabChanged(index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image.asset("images/ic_home_scene.png"),
            icon: Image.asset("images/ic_home_scene.png"),
            label: "场景组件",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset("images/ic_home_common.png"),
            icon: Image.asset("images/ic_home_common.png"),
            label: "通用组件",
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset("images/ic_home_about.png"),
            icon: Image.asset("images/ic_home_about.png"),
            label: "我们团队",
          ),
        ],
      ),
    );
  }
}
