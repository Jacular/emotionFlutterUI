import 'package:amotionflutterui/config/url_config.dart';
import 'package:amotionflutterui/generated/i18n.dart';
import 'package:amotionflutterui/splash_page.dart';
import 'package:amotionflutterui/utils/statusbar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'delegate/cupertino_localizations_delegate.dart';

void main() {
  runApp(MyApp());
}
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initEnvironment();
    SystemChrome.setSystemUIOverlayStyle(statusBarDark);
    return MaterialApp(//Flutter之MaterialApp使用详解
      //国际化-----------------------------------------------
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        ChinaCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
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

