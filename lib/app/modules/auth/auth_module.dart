import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import 'login/pages/login_page.dart';
import 'login/repositories/login_repository.dart';
import 'login/stores/login_store.dart';
import 'register/pages/register_page.dart';
import 'register/repositories/register_repository.dart';
import 'register/stores/register_store.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  @override
  void binds(Injector i) {
    i.addLazySingleton(LoginRepository.new);
    i.addLazySingleton(LoginStore.new);

    i.addLazySingleton(RegisterRepository.new);
    i.addLazySingleton(RegisterStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/login', child: (_) => LoginPage(loginStore: Modular.get()));
    r.child(
      '/register',
      child: (_) => RegisterPage(registerStore: Modular.get()),
    );
  }
}
