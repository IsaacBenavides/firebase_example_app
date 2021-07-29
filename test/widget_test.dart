import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:remote_config/utils/u_remote_config.dart';

typedef Callback(MethodCall call);

setupCloudFirestoreMocks([Callback customHandlers]) {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFirebase.channel.setMockMethodCallHandler((call) async {
    if (call.method == 'Firebase#initializeCore') {
      return [
        {
          'name': defaultFirebaseAppName,
          'options': {
            'apiKey': '123',
            'appId': '123',
            'messagingSenderId': '123',
            'projectId': '123',
          },
          'pluginConstants': {},
        }
      ];
    }

    if (call.method == 'Firebase#initializeApp') {
      return {
        'name': call.arguments['appName'],
        'options': call.arguments['options'],
        'pluginConstants': {},
      };
    }

    if (customHandlers != null) {
      customHandlers(call);
    }

    return null;
  });
}

class ConfigServiceMock extends Mock implements RemoteConfig {}

void main() async {
  setupCloudFirestoreMocks();
  await Firebase.initializeApp();

  setUp(() {
    Get.testMode = true;
  });

  test("remote config test", () async {
    Get.reset();
    // ignore: unnecessary_cast
    RemoteConfig remoteConfig = ConfigServiceMock() as RemoteConfig;
    print(remoteConfig.fetchAndActivate());
    when(remoteConfig.fetchAndActivate()).thenAnswer((_) async => true);
    print(await remoteConfig.fetchAndActivate());
    Get.lazyPut(() => ConfigService(remoteConfig: remoteConfig));
    ConfigService configService = Get.find<ConfigService>();
    print(await configService.firebaseRemoteConfig());
    expect(await configService.firebaseRemoteConfig(), true);
  });
}
