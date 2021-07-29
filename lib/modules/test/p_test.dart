import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remote_config/modules/test/c_test.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TestController>(
        init: TestController(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_.title.value),
            ),
            body: Center(
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await _.setRemoteConfig();
                      },
                      child: Text(
                        "actualizar",
                      )),
                ],
              ),
            ),
          );
        });
  }
}
