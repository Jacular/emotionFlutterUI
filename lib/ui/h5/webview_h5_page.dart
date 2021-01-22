import 'package:amotionflutterui/color/color.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

///加载H5页面
class WebViewH5Page extends StatefulWidget {
  final String url;
  final String title;

  WebViewH5Page({this.url, this.title});

  @override
  _WebViewH5PageState createState() => _WebViewH5PageState();
}

class _WebViewH5PageState extends State<WebViewH5Page> {
  WebViewController _controller;
  String _title = "webview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          brightness: Brightness.light,
          elevation: 0,
          title: Text(
            widget.title ?? _title,
            style: TextStyle(fontSize: Adapt.px(20), color: color333333),
          ),
        ),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          ///JS执行模式
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onPageFinished: (url) {
            //在网页加载成功后,把JS需要获取的Flutter的值，注入到widow上, 在JS中就可以通过widow获取到相应的值
//            String script = "window.isLogin=是否登录";
//            _controller.evaluateJavascript(script).then((result){
//
//            }
//            );
            _controller.evaluateJavascript("document.title").then((result) {
              setState(() {
                _title = result;
              });
            });
          },
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith("myapp://")) {
              print("即将打开 ${request.url}");
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          javascriptChannels: <JavascriptChannel>[
            JavascriptChannel(
                name: "share",
                onMessageReceived: (JavascriptMessage message) {
                  print("参数： ${message.message}");

                  String callbackname = message.message; //实际应用中要通过map通过key获取

                  String data = "收到消息调用了";
                  String script = "$callbackname($data)";
                  _controller.evaluateJavascript(script);
                }),
          ].toSet(),
        ));
  }
}
