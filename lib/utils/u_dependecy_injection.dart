import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';
import 'package:remote_config/modules/home/c_home.dart';
import 'package:remote_config/modules/initial/c_splash.dart';
import 'package:remote_config/utils/u_remote_config.dart';
import 'package:remote_config/utils/u_session.dart';

class DependencyInjection {
  static void init() {
    RemoteConfig _remoteConfig = RemoteConfig.instance;
    Get.lazyPut<InitialController>(() => InitialController());
    Get.lazyPut<HomeController>(() => HomeController());

    Get.lazyPut<ConfigService>(
        () => ConfigService(remoteConfig: _remoteConfig));
    Get.lazyPut<SessionService>(() => SessionService());
  }
}
