import 'package:amotionflutterui/config/url_config.dart';
import 'package:amotionflutterui/delegate/cupertino_localizations_delegate.dart';
import 'package:amotionflutterui/home_page.dart';
import 'package:amotionflutterui/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initEnvironment();
    return MaterialApp(//Flutter之MaterialApp使用详解
      localizationsDelegates: [//（本地化委托）
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ChinaCupertinoLocalizations.delegate,
      ],
      supportedLocales: [//（支持区域）
        const Locale('en', 'US'),
        const Locale('zh', 'CH'),
      ],
      locale: Locale('zh'),//(地点)
      title: 'Emotion Flutter UI',//（标题）
      navigatorKey: navigatorKey,//（导航键）
      debugShowCheckedModeBanner: false,//去掉右上角DEBUG
      theme: ThemeData(//（主题）
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',//（初始路由）
      routes: {
        // '/': (context) => SplashPage(),
        // '/MyHomePage': (context) => MyHomePage(),
      },
      home: SplashPage(),
    );
  }
}

