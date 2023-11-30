import '../../domain/params/login_param.dart';
import '../../domain/responses/login_response.dart';

abstract class ILoginDatasource {
  Future<LoginResponse> login(LoginParam param);
}
