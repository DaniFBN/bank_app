import 'dart:convert';
import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

import 'i_local_storage.dart';

class SharedPreferencesLocalStorage implements ILocalStorage {
  const SharedPreferencesLocalStorage(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<int> save(
    String key,
    Map<String, dynamic> data,
  ) async {
    final id = Random().nextInt(999999);
    final handledData = {'id': id, ...data};
    final newData = jsonEncode(handledData);

    final currentData = _preferences.getStringList(key) ?? [];
    currentData.add(newData);

    await _preferences.setStringList(key, currentData);

    return id;
  }

  @override
  Future<List<Map<String, dynamic>>> get(String key) async {
    final currentData = _preferences.getStringList(key) ?? [];

    final data = currentData.map((e) {
      return Map<String, dynamic>.from(jsonDecode(e));
    });

    return data.toList();
  }
}
