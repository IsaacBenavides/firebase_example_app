import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get/get.dart';

class ConfigService extends GetxService {
  final RemoteConfig remoteConfig;

  ConfigService({this.remoteConfig});
  @override
  onInit() async {
    super.onInit();
    await firebaseRemoteConfig();
  }

  Future<bool> fetchAndActivate() async =>
      await remoteConfig.fetchAndActivate();

  Future<void> setConfigSettings(
      Duration fetchTimeout, Duration minimumFetchInterval) async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: fetchTimeout,
        minimumFetchInterval: minimumFetchInterval));
  }

  Future<bool> firebaseRemoteConfig() async {
    await setConfigSettings(
        const Duration(seconds: 10), const Duration(hours: 12));
    RemoteConfigValue(null, ValueSource.valueStatic);
    if (await fetchAndActivate()) return true;
    return false;
  }

  Future<void> updateRemoteConfigValues() async {
    await setConfigSettings(Duration(seconds: 10), Duration.zero);
    await fetchAndActivate();
  }

  getString(String key) => remoteConfig.getString(key);

  getBool(String key) => remoteConfig.getBool(key);

  getAll() => remoteConfig.getAll();

  getDouble(String key) => remoteConfig.getDouble(key);

  getInt(String key) => remoteConfig.getInt(key);

  getValue(String key) => remoteConfig.getValue(key);
}
