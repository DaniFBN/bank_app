import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared/services/local_storage/i_local_storage.dart';
import 'shared/services/local_storage/shared_preferences_local_storage.dart';

class CoreModule extends Module {
  static late final SharedPreferences _preferences;
  static Future<void> initializeAsyncBinds() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  void exportedBinds(Injector i) {
    i.addInstance(_preferences);
    i.addLazySingleton<ILocalStorage>(SharedPreferencesLocalStorage.new);
  }
}
