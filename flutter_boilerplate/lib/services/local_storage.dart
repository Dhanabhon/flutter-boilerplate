import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter_boilerplate/main.dart';

class LocalStorageService {
  FlutterSecureStorage? _preferences;

  LocalStorageService._internal();

  factory LocalStorageService() {
    return LocalStorageService._internal();
  }

  Future<FlutterSecureStorage?> getInstance() async {
    _preferences ??= const FlutterSecureStorage();

    $log.debug('[local_storage.dart][getInstance]: Initializing...');

    return _preferences;
  }

  Future<void> saveDataToStorage({required String key, String? value}) async {
    FlutterSecureStorage? prefs = await getInstance();
    await prefs?.write(key: key, value: value);

    $log.debug(
        '[local_storage.dart][saveDataToStorage]: Key: {$key}, Value: {$value}');
  }

  Future<String?> readDataFromStorage({required String key}) async {
    FlutterSecureStorage? prefs = await getInstance();
    String? value = await prefs?.read(key: key);

    $log.debug(
        '[local_storage.dart][readDataFromStorage]: Key: {$key}, Value: {$value}');

    return value;
  }

  Future<void> deleteDataInStorage({required String key}) async {
    FlutterSecureStorage? prefs = await getInstance();
    await prefs?.delete(key: key);

    $log.debug(
        '[local_storage.dart][deleteDataInStorage]: Key: {$key} has been deleted.');
  }

  Future<void> deleteAllDataInStorage() async {
    FlutterSecureStorage? prefs = await getInstance();
    await prefs?.deleteAll();

    $log.debug(
        '[local_storage.dart][deleteAllDataInStorage]: Delete all data.');
  }
}
