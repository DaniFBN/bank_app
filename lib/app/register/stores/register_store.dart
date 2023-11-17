import 'package:flutter/material.dart';

import '../register_param.dart';
import '../repositories/register_repository.dart';
import 'register_state.dart';

class RegisterStore extends ChangeNotifier {
  RegisterState state = const InitialRegisterState();

  final RegisterRepository _repository;

  RegisterStore(this._repository);

  Future<void> register(RegisterParam param) async {
    state = const LoadingRegisterState();
    notifyListeners();

    final isRegistered = await _repository.register(param);

    if (isRegistered) {
      state = const LoggedRegisterState();
    } else {
      state = const FailureRegisterState();
    }
    notifyListeners();
  }
}
