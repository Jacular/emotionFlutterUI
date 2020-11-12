import 'package:amotionflutterui/utils/adapt.dart';
import 'package:flutter/material.dart';
///我们
class WePage extends StatefulWidget {
  @override
  _WePageState createState() => _WePageState();
}

class _WePageState extends State<WePage> {
  String versionCode;
  @override
  void initState() {
    super.initState();
  }

  Widget _buildHeader() {
    return InkWell(
      onTap: null,
      child: Padding(
        padding: EdgeInsets.all(Adapt.px(16)),
        child: Row(
          children: <Widget>[
            SizedBox(width: Adapt.px(16)),
            Text("关于我们")
          ],
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: Adapt.px(32)),
          _buildHeader(),
        ],
      ),
    );
  }
}
