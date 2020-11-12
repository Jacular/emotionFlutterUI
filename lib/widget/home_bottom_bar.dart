import 'package:amotionflutterui/color/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            activeIcon: SvgPicture.asset("images/ic_home_scene.svg"),
            icon: SvgPicture.asset("images/ic_home_scene.svg"),
            label: "场景组件",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("images/ic_home_common.svg"),
            icon: SvgPicture.asset("images/ic_home_common.svg"),
            label: "通用组件",
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset("images/ic_home_about.svg"),
            icon: SvgPicture.asset("images/ic_home_about.svg"),
            label: "关于我们",
          ),
        ],
      ),
    );
  }
}
