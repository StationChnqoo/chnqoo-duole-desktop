import 'package:duole/pages/fkbh/index.dart';
import 'package:duole/pages/home/index.dart';
import 'package:duole/pages/wfbh/index.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String APP = "/app";
  static String HOME = "/";
  static String WFBH = '/wfbh';
  static String FKBH = '/fkbh';

  static List<GetPage> routes = [
    // GetPage(name: APP, page: () => App()),
    GetPage(name: HOME, page: () => HomePage()),
    GetPage(name: WFBH, page: () => WfbhPage()),
    GetPage(name: FKBH, page: () => FkbhPage()),
  ];
}
