
String BASE_URL;
String BASE_URL2;
String BASE_URL3;
String BASE_URL4;
String BASE_URL5;
String BASE_URL6;
String BASE_URL8;
String BASE_URL9;

initEnvironment() {
  const bool inProduction = const bool.fromEnvironment("dart.vm.product");
  if (inProduction) {
    BASE_URL = "https://b00.dandroid.cn/";
    BASE_URL2 = "https://b01.dandroid.cn/";
    BASE_URL3 = "https://b02.dandroid.cn/";
    BASE_URL4 = "https://b03.dandroid.cn/";
    BASE_URL5 = "https://b04.dandroid.cn/";
    BASE_URL6 = "https://b05.dandroid.cn/";
  } else {
    BASE_URL = "https://test.dandroid.cn/member/";
    BASE_URL2 = "https://test.dandroid.cn/manager/";
    BASE_URL3 = "https://test.dandroid.cn/permission/";
    BASE_URL4 = "https://test.dandroid.cn/pay/";
    BASE_URL5 = "https://test.dandroid.cn/market/";
    BASE_URL6 = "https://test.dandroid.cn/park/";
  }
}