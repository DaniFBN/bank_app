import '../../../../core/shared/services/local_storage/i_local_storage.dart';
import '../domain/params/login_param.dart';
import '../domain/responses/login_response.dart';
import '../infra/datasources/i_login_datasource.dart';

class LoginDatasource implements ILoginDatasource {
  final ILocalStorage _localStorage;

  const LoginDatasource(this._localStorage);

  @override
  Future<LoginResponse> login(LoginParam param) async {
    final users = await _localStorage.get('users');

    for (final user in users) {
      if (user['email'] == param.email) {
        if (user['senha'] == param.password) {
          return const LoginResponse('USER-ID');
        }
        throw 'Senha incorreta';
      }
    }

    throw 'Usuário não encontrado';
  }
}
