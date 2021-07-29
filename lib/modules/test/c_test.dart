import 'package:get/get.dart';
import 'package:remote_config/utils/u_remote_config.dart';

class TestController extends GetxController {
  ConfigService _remoteConfig = Get.find<ConfigService>();

  RxString title = "".obs;
  @override
  void onInit() async {
    setInitialValues();
    super.onInit();
  }

  Future<void> setRemoteConfig() async {
    _remoteConfig.updateRemoteConfigValues();
    setInitialValues();
  }

  setInitialValues() {
    title.value = _remoteConfig.getString("test_page_title");
    update();
  }
}
