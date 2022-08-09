import 'package:flutter/material.dart';
import 'package:amotionflutterui/model/Icon_item.dart';

//菜单样式
class NavMenuItem extends StatefulWidget {
  final IconItem iconItem;
  final Function onTap;
  const NavMenuItem({Key key, this.iconItem, this.onTap}) : super(key: key);

  @override
  _NavMenuItemState createState() => _NavMenuItemState();
}

class _NavMenuItemState extends State<NavMenuItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width / 5-5,
        child: Column(
          children: <Widget>[
            Image(
              width: 40,
              image: AssetImage('image/${widget.iconItem.icon}.png'),
              fit: BoxFit.contain,
            ),
            Expanded(child: Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                widget.iconItem.title,
                style: TextStyle(color: Color(0xff303741), fontSize: 11),
              ),
            )),
          ],
        ),
      ),
      onTap: () {
        widget.onTap(widget.iconItem);
      },
    );
  }
}
