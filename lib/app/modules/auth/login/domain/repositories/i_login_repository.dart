import '../params/login_param.dart';
import '../responses/login_response.dart';

abstract class ILoginRepository {
  Future<LoginResponse> login(LoginParam param);
}
