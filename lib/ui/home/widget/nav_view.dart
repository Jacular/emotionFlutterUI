import 'package:flutter/material.dart';
import 'package:amotionflutterui/model/Icon_item.dart';
import 'package:amotionflutterui/ui/carlife/nav_menu_item.dart';
///菜单
class NavView extends StatelessWidget {
  NavView({this.onTap, this.list});
  final Function onTap;
  final List<IconItem> list;

  Column _buildColumn(BuildContext context) {
    List<Widget> firstLine =[];
    for (int i = 0; i < list.length; i++) {
      Widget item = NavMenuItem(iconItem:list[i], onTap:() {

      });
      if (i < 5) {
        firstLine.add(item);
      }
    }
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: firstLine,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: _buildColumn(context));
  }
}
