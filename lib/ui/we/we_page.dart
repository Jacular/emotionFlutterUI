import 'package:amotionflutterui/color/color.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:amotionflutterui/widget/agreement/user_agreement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';


class WePage extends StatelessWidget {
  final String versionCode;

  const WePage({Key key, this.versionCode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("关于我们"),
      ),
      body:Stack(
        children: <Widget>[

          Align(
            alignment:Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(height: Adapt.px(80)),
                Image(
                    image: AssetImage("images/ic_launcher.png"),
                    width: Adapt.px(70),
                    height: Adapt.px(70)),
                SizedBox(height: Adapt.px(24)),
                Text("当前版本: V$versionCode",
                    style: TextStyle(
                      color: color333333,
                      fontSize: Adapt.px(16),
                    )),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[

                UserAgreementWight(),
                SizedBox(height: Adapt.px(8)),
                Text("emotionUI  版权所有",
                    style: TextStyle(
                      color: color999999,
                      fontSize: Adapt.px(16),
                    )),
                SizedBox(height: Adapt.px(8))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
