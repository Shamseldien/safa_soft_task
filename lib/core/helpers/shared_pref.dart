import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsSingleton {
  static final SharedPrefsSingleton _instance = SharedPrefsSingleton._internal();

  factory SharedPrefsSingleton() {
    return _instance;
  }

  SharedPrefsSingleton._internal();

  SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<bool> saveList(String key, List<dynamic> list) async {
    if (_prefs == null) {
      await init();
    }
    List<String> encodedList = list.map((item) => json.encode(item)).toList();
    return await _prefs.setStringList(key, encodedList);
  }

  List<T> getList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    if (_prefs == null) {
      throw Exception("SharedPreferences is not initialized");
    }
    List<String> encodedList = _prefs.getStringList(key) ?? [];
    List<T> decodedList = encodedList.map((item) {
      Map<String, dynamic> decodedItem = json.decode(item);
      return fromJson(decodedItem);
    }).toList();
    return decodedList;
  }
}
