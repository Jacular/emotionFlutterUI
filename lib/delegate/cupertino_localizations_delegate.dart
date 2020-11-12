import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class _CupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const _CupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'zh';

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      ChinaCupertinoLocalizations.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<CupertinoLocalizations> old) => false;
}

class ChinaCupertinoLocalizations implements CupertinoLocalizations {
  const ChinaCupertinoLocalizations();

  static const LocalizationsDelegate<CupertinoLocalizations> delegate =
      _CupertinoLocalizationsDelegate();

  static Future<CupertinoLocalizations> load(Locale locale) {
    return SynchronousFuture<CupertinoLocalizations>(
        const ChinaCupertinoLocalizations());
  }

  @override
  String get alertDialogLabel => null;

  @override
  String get anteMeridiemAbbreviation => "上午";

  @override
  String get copyButtonLabel => "复制";

  @override
  String get cutButtonLabel => "剪切";

  @override
  DatePickerDateOrder get datePickerDateOrder => DatePickerDateOrder.ymd;

  @override
  DatePickerDateTimeOrder get datePickerDateTimeOrder =>
      DatePickerDateTimeOrder.date_dayPeriod_time;

  @override
  String datePickerDayOfMonth(int dayIndex) {
    return "$dayIndex日";
  }

  @override
  String datePickerHour(int hour) {
    return "$hour时";
  }

  @override
  String datePickerHourSemanticsLabel(int hour) {
    return "$hour时";
  }

  @override
  String datePickerMediumDate(DateTime date) {
    return "";
  }

  @override
  String datePickerMinute(int minute) {
    return "$minute分";
  }

  @override
  String datePickerMinuteSemanticsLabel(int minute) {
    return "";
  }

  @override
  String datePickerMonth(int monthIndex) {
    return "$monthIndex月";
  }

  @override
  String datePickerYear(int yearIndex) {
    return "$yearIndex年";
  }

  @override
  String get pasteButtonLabel => "粘贴";

  @override
  String get postMeridiemAbbreviation => "下午";

  @override
  String get selectAllButtonLabel => "全选";

  @override
  String timerPickerHour(int hour) {
    return "$hour";
  }

  @override
  String timerPickerHourLabel(int hour) {
    return "$hour";
  }

  @override
  String timerPickerMinute(int minute) {
    return "$minute";
  }

  @override
  String timerPickerMinuteLabel(int minute) {
    return "$minute";
  }

  @override
  String timerPickerSecond(int second) {
    return "$second";
  }

  @override
  String timerPickerSecondLabel(int second) {
    return "$second";
  }

  @override
  String get todayLabel => "今天";

  String get modalBarrierDismissLabel => "";

  @override
  String tabSemanticsLabel({int tabIndex, int tabCount}) {
    return "";
  }

  @override
  List<String> get timerPickerHourLabels => ["时"];

  @override
  List<String> get timerPickerMinuteLabels => ["分"];

  @override
  List<String> get timerPickerSecondLabels => ["秒"];
}
