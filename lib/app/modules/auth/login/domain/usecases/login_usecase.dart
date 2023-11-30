import 'package:fpdart/fpdart.dart';

import '../params/login_param.dart';
import '../repositories/i_login_repository.dart';
import '../responses/login_response.dart';

// Caso de uso
// Objetivo: Executar a regra de negócio
// Nome: Obrigatoriamente é um Verbo/Ação
// Nome do método: Boa prática é ser `call`
// Quantidade de métodos: Obrigatoriamente, 1(publico)
// Design Pattern: Command
abstract class ILoginUsecase {
  Future<Either<Exception, LoginResponse>> call(LoginParam param);
}

class LoginUsecase implements ILoginUsecase {
  final ILoginRepository _repository;

  const LoginUsecase(this._repository);

  @override
  Future<Either<Exception, LoginResponse>> call(LoginParam param) async {
    final emailRegex = RegExp(
      r'^[a-zA-Z][a-zA-Z0-9_\-.]+@(gmail|outlook|hotmail).com(\.br)?$',
    );
    if (!emailRegex.hasMatch(param.email)) {
      return Left(Exception('Email inválido'));
    }

    if (param.password.isEmpty || param.password.length < 8) {
      return Left(Exception('Senha inválida'));
    }

    return Right(await _repository.login(param));
  }
}
