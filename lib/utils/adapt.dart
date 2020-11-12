import 'dart:ui';

import 'package:amotionflutterui/constants/constants.dart';
import 'package:flutter/material.dart';

class Adapt {

  /// 统一 阴影
  static const double elevation = 2;

  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _topbarH = mediaQuery.padding.top;
  static double _botbarH = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;
  static var _ratio;

  static init(int number) {
    int uiWidth = number is int ? number : DESIGN_WIDTH;
    _ratio = _width / uiWidth;
  }

  static px(number) {
    if (!(_ratio is double || _ratio is int)) {
      Adapt.init(DESIGN_WIDTH);
    }
    return number * _ratio;
  }

  static onepx() {
    return 1 / _pixelRatio;
  }

  static screenW() {
    return _width;
  }

  static screenH() {
    return _height;
  }

  static padTopH() {
    return _topbarH;
  }

  static padBotH() {
    return _botbarH;
  }
}
