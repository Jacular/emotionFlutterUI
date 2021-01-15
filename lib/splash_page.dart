import 'dart:async';

import 'package:amotionflutterui/home_page.dart';
import 'package:amotionflutterui/utils/adapt.dart';
import 'package:flutter/material.dart';

import 'color/color.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _initTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _stopTimer();
  }

  void _initTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (time) {
      if (time.tick == 3) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'Emotion Flutter UI')));
      }
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
    print("Timer stoped.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Align(
            alignment:Alignment.center,
            child: Image(
                image: AssetImage("images/ic_launcher.png"),
                width: Adapt.px(200),
                height: Adapt.px(270)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: Adapt.px(8)),
                Text("Emotion Flutter UI",
                    style: TextStyle(
                      color: color999999,
                      fontSize: Adapt.px(16),
                    )),
                SizedBox(height: 80.0)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
