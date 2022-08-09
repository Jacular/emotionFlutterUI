import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class HomeBar extends StatelessWidget {
  final double height;
  final double elevation; //阴影
  final Widget leading;
  final String hintText;
  final FocusNode focusNode;
  final TextEditingController controller;
  final IconData prefixIcon;
  final VoidCallback onEditingComplete;
  final Color fontColor;
  final Color fillColor;
  final Color bgColor;
  final bool showShdow;
  final double opacity;
  final VoidCallback onTextFieldClick;
  final bool slided;
  final bool showInput;
  HomeBar(
      {Key key,
      this.opacity = 1,
      this.showShdow = false,
      this.fontColor = Colors.white,
      this.fillColor = Colors.white,
      this.bgColor = const Color.fromRGBO(255, 255, 255, 0),
      this.height: 46.0,
      this.elevation: 0.5,
      this.leading,
      this.hintText: '请输入关键词',
      this.focusNode,
      this.controller,
      this.onEditingComplete,
      this.prefixIcon: Icons.search,
      this.onTextFieldClick,
      this.slided = false,
      this.showInput=true,
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        Expanded(
            flex: 15,
            child: Container(
              height: 32,
              child: showInput?TextField(
                enabled: false,
                onTap: () {
                  onTextFieldClick();
                },
                controller: controller,
                cursorWidth: 1,
                scrollPadding: EdgeInsets.all(0),
                cursorColor: Colors.black26,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14, color: Colors.black45),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black45,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  contentPadding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                  filled: true,
                  fillColor: fillColor,
                ),
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
                textInputAction: TextInputAction.done,
              ):null,
            )),
        Expanded(
          flex: 2,
          child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Icon(
                Icons.qr_code,
                color: fontColor,
              )),
        )
      ],
    );
  }
}
