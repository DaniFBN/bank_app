sealed class RegisterState {
  const RegisterState();
}

class InitialRegisterState extends RegisterState {
  const InitialRegisterState();
}

class LoadingRegisterState extends RegisterState {
  const LoadingRegisterState();
}

class FailureRegisterState extends RegisterState {
  const FailureRegisterState();
}

class LoggedRegisterState extends RegisterState {
  const LoggedRegisterState();
}
