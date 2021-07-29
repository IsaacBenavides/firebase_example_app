import 'package:get/get.dart';
import 'package:remote_config/modules/home/p_home.dart';
import 'package:remote_config/modules/initial/p_splash.dart';
import 'package:remote_config/modules/test/p_test.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(name: "splash", page: () => SplashScreen()),
    GetPage(name: "home", page: () => HomePage()),
    GetPage(name: "test", page: () => Test())
  ];
}
