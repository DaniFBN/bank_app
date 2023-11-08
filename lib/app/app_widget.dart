import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home_page.dart';
import 'pages/register_page.dart';
import 'services/local_storage/shared_preferences_local_storage.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/register',
      routes: {
        '/register': (_) {
          return FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }

              return RegisterPage(
                localStorage: SharedPreferencesLocalStorage(snapshot.data!),
              );
            },
          );
        },
        '/': (_) => const HomePage(),
      },
    );
  }
}
