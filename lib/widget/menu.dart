import 'package:amotionflutterui/color/color.dart';
import 'package:amotionflutterui/entity/menu_entity.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  final MenuList menuList;
  final Function(Menu) itemClick;

  const MenuWidget({Key key, this.menuList, this.itemClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: Adapt.px(16)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Adapt.px(16)),
          child: Text(
            menuList.name,
            style: TextStyle(
                fontSize: Adapt.px(20),
                color: color666666,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: Adapt.px(6)),

        GridView.builder(
          shrinkWrap: true,
          itemCount: (menuList.childs == null) ? 0 : menuList.childs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, childAspectRatio: 0.85),
          itemBuilder: (context, index) =>
              WorkMenuItem(menu: menuList.childs[index], itemClick: itemClick),
          controller: new ScrollController(keepScrollOffset: false),
        ),
        SizedBox(height: Adapt.px(10)),
      ],
    );
  }
}

class WorkMenuItem extends StatelessWidget {
  final Menu menu;
  final Function(Menu) itemClick;

  const WorkMenuItem({Key key, this.menu, this.itemClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        itemClick(menu);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Adapt.px(16)),
        child: Column(
          children: <Widget>[
            Image(
              image: menu.assetName.contains("http")?NetworkImage(menu.assetName):AssetImage(menu.assetName),
              width: Adapt.px(42),
              height: Adapt.px(42),
            ),
            SizedBox(height: Adapt.px(8)),
            Expanded(
              child: Text(
                menu.name,
                style: TextStyle(fontSize: Adapt.px(14), color: color666666),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
