import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static FlutterSecureStorage? _preferences;

  static Future<LocalStorageService?> getInstance() async {
    _instance ??= LocalStorageService();

    _preferences ??= const FlutterSecureStorage();

    return _instance;
  }

  static Future<void> saveDataToStorage(
      {required String key, String? value}) async {
    await _preferences?.write(key: key, value: value);
  }

  static Future<String?>? readDataFromStorage({required String key}) async {
    return await _preferences?.read(key: key);
  }

  static Future<void> deleteDataInStorage({required String key}) async {
    await _preferences?.delete(key: key);
  }

  static Future<void> deleteAllDataInStorage() async {
    await _preferences?.deleteAll();
  }
}
