import 'package:get/get.dart';
import 'package:remote_config/utils/u_remote_config.dart';

class HomeController extends GetxController {
  ConfigService _remoteConfig = Get.find<ConfigService>();

  RxString welcome = "".obs;
  RxString second = "".obs;
  RxString title = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  setRemoteConfig() async {
    await _remoteConfig.updateRemoteConfigValues();
    setInitialValues();
  }

  setInitialValues() {
    welcome.value = _remoteConfig.getString("from_server");
    title.value = _remoteConfig.getString("home_page_title");
    update();
  }
}
