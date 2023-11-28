import 'package:flutter_modular/flutter_modular.dart';

import 'modules/auth/auth_module.dart';
import 'pages/home_page.dart';

class AppModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: AuthModule());
    r.child('/', child: (_) => const HomePage());
  }
}
