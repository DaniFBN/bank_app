import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login/pages/login_page.dart';
import 'login/repositories/login_repository.dart';
import 'login/stores/login_store.dart';
import 'pages/home_page.dart';
import 'pages/splash_page.dart';
import 'register/pages/register_page.dart';
import 'register/repositories/register_repository.dart';
import 'register/stores/register_store.dart';
import 'services/local_storage/i_local_storage.dart';
import 'services/local_storage/shared_preferences_local_storage.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  SharedPreferences? _sharedPreferences;

  Future<bool> loadAsyncBinds() async {
    if (_sharedPreferences != null) {
      return true;
    }
    _sharedPreferences = await SharedPreferences.getInstance();

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: loadAsyncBinds(),
      builder: (_, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(home: SplashPage());
        }

        return MultiProvider(
          providers: [
            Provider(create: (_) => _sharedPreferences),
            Provider<ILocalStorage>(
              create: (context) => SharedPreferencesLocalStorage(
                context.read(),
              ),
            ),
            Provider(create: (context) => LoginRepository(context.read())),
            Provider(create: (context) => LoginStore(context.read())),
            Provider(create: (context) => RegisterRepository(context.read())),
            Provider(create: (context) => RegisterStore(context.read())),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/login',
            routes: {
              '/': (_) => const HomePage(),
              '/login': (context) => LoginPage(loginStore: context.read()),
              '/register': (context) {
                return RegisterPage(registerStore: context.read());
              },
            },
          ),
        );
      },
    );
  }
}
