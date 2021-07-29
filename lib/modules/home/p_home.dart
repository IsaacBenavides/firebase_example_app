import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:remote_config/modules/home/c_home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Obx(() {
                return Text(_.title.value);
              }),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    return Text(
                      _.welcome.value,
                      style: TextStyle(fontSize: 25.sp),
                    );
                  }),
                  Obx(() {
                    return Text(
                      _.second.value,
                      style: TextStyle(fontSize: 25.sp),
                    );
                  }),
                  SizedBox(
                    height: 10.sp,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await _.setRemoteConfig();
                      },
                      child: Text(
                        "actualizar",
                      )),
                  SizedBox(
                    height: 10.sp,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.toNamed("test");
                      },
                      child: Text("navegar")),
                ],
              ),
            ),
          );
        });
  }
}
