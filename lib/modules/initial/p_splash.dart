import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:remote_config/modules/initial/c_splash.dart';

class SplashScreen extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    controller.transition();
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 400.sp),
      ),
    );
  }
}
