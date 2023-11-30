import '../../domain/params/login_param.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../../domain/responses/login_response.dart';
import '../datasources/i_login_datasource.dart';

class LoginRepository implements ILoginRepository {
  final ILoginDatasource _datasource;

  const LoginRepository(this._datasource);

  @override
  Future<LoginResponse> login(LoginParam param) async {
    try {
      return _datasource.login(param);
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
