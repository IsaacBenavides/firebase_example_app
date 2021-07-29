import 'package:get/get.dart';

class InitialController extends GetxController {
  void transition() {
    Future.delayed(const Duration(seconds: 2), () async {
      Get.offNamedUntil("home", (route) => false);
    });
  }
}
