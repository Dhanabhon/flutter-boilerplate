import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_boilerplate/config/locator.dart';
import 'package:flutter_boilerplate/config/logger.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static FlutterSecureStorage? _preferences;

  final log = locator.get<AppLogger>();

  static Future<LocalStorageService?> getInstance() async {
    _instance ??= LocalStorageService();

    _preferences ??= const FlutterSecureStorage();

    return _instance;
  }

  Future<void> saveDataToStorage({required String key, String? value}) async {
    await _preferences?.write(key: key, value: value);

    log.debug(
        '[local_storage.dart][saveDataToStorage]: Key: {$key}, Value: {$value}');
  }

  Future<String?> readDataFromStorage({required String key}) async {
    String? value = await _preferences?.read(key: key);

    log.debug(
        '[local_storage.dart][readDataFromStorage]: Key: {$key}, Value: {$value}');

    return value;
  }

  Future<void> deleteDataInStorage({required String key}) async {
    await _preferences?.delete(key: key);

    log.debug(
        '[local_storage.dart][deleteDataInStorage]: Key: {$key} has been deleted.');
  }

  Future<void> deleteAllDataInStorage() async {
    await _preferences?.deleteAll();

    log.debug('[local_storage.dart][deleteAllDataInStorage]: Delete all data.');
  }
}
