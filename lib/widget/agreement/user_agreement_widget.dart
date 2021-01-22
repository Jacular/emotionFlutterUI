import 'package:amotionflutterui/color/color.dart';
import 'package:amotionflutterui/config/url_config.dart';
import 'package:amotionflutterui/ui/h5/webview_h5_page.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


/// 用户协议中“低调”文本的样式。
final TextStyle _lowProfileStyle = TextStyle(
  fontSize: Adapt.px(12),
  color: color999999,
);

/// 用户协议中“高调”文本的样式。
final TextStyle _highProfileStyle = TextStyle(
  fontSize: Adapt.px(12),
  color: colorPrimary,
);

class UserAgreementWight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '我已阅读并同意',
        style: _lowProfileStyle,
        children: [
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebViewH5Page(url:BASE_URL+"agreement/agreementUsed.html",title:"用户协议")));
            },
            text: '“用户协议”',
            style: _highProfileStyle,
          ),
          TextSpan(
            text: '和',
            style: _lowProfileStyle,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebViewH5Page(url:BASE_URL+"agreement/agreementPrivacy.html",title:"隐私政策")));
            },
            text: '“隐私政策”',
            style: _highProfileStyle,
          ),
        ],
      ),
    );
  }
}
