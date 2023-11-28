import 'package:flutter/material.dart';

import '../repositories/login_repository.dart';
import 'states/login_state.dart';

class LoginStore extends ChangeNotifier {
  LoginStore(this._repository);

  LoginState state = const InitialLoginState();
  final LoginRepository _repository;

  bool get isLoading => state is LoadingLoginState;

  Future<void> login(String email, String password) async {
    state = const LoadingLoginState();
    notifyListeners();

    final isLogged = await _repository.login(email, password);

    if (isLogged) {
      state = const LoggedLoginState();
    } else {
      state = const FailureLoginState();
    }
    notifyListeners();
  }
}
