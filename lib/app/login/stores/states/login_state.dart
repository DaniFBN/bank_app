sealed class LoginState {
  const LoginState();
}

class InitialLoginState extends LoginState {
  const InitialLoginState();
}

class LoadingLoginState extends LoginState {
  const LoadingLoginState();
}

class FailureLoginState extends LoginState {
  const FailureLoginState();
}

class LoggedLoginState extends LoginState {
  const LoggedLoginState();
}
