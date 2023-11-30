import 'package:flutter/material.dart';

import '../../domain/params/login_param.dart';
import '../../domain/usecases/login_usecase.dart';
import 'states/login_state.dart';

class LoginStore extends ChangeNotifier {
  LoginStore(this._loginUsecase);

  LoginState state = const InitialLoginState();
  final ILoginUsecase _loginUsecase;

  bool get isLoading => state is LoadingLoginState;

  Future<void> login(LoginParam param) async {
    state = const LoadingLoginState();
    notifyListeners();

    try {
      final response = await _loginUsecase(param);
      response.fold(
        (l) => state = FailureLoginState(l.toString()),
        (r) => state = const LoggedLoginState(),
      );
    } catch (e) {
      state = FailureLoginState(e.toString());
    }

    notifyListeners();
  }
}
