import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  static final TLocalStorage _instance = TLocalStorage._internal();

  factory TLocalStorage() {
    return _instance;
  }

  TLocalStorage._internal();

  final _storage = GetStorage();

  // Saves data from storage
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Reads data from storage
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Removes data from storage
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clears all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}