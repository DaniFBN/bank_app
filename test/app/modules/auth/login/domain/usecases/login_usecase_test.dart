import 'package:bank_app/app/modules/auth/login/domain/params/login_param.dart';
import 'package:bank_app/app/modules/auth/login/domain/repositories/i_login_repository.dart';
import 'package:bank_app/app/modules/auth/login/domain/responses/login_response.dart';
import 'package:bank_app/app/modules/auth/login/domain/usecases/login_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

void main() {
  final repository = LoginRepositoryMock();
  final sut = LoginUsecase(repository);

  group('LoginUsecase | Success', () {
    test(
      "ASAS",
      () async {
        const email = 'daniel123.asasas-asass_asas@gmail.com';
        final param = const LoginParam(email: email, password: '123456789');
        when(() => repository.login(param))
            .thenAnswer((_) async => const LoginResponse(''));

        final response = await sut(param);

        expect(response.isRight(), isTrue);

        verify(() => repository.login(param)).called(1);
      },
    );
  });

  group('LoginUsecase | Failure', () {
    test(
      "deve retornar 'Email inválido' quando não começar com uma letra",
      () async {
        // Triple A/GivenWhenThen

        // Arrange/Given
        // Mock/Preparação dos dados
        final param = const LoginParam(email: '9daniel@dev.com', password: '');

        // Act/When
        // Chamar a método
        final response = await sut(param);

        // Assert/Then
        // Se deu certo ou errado(Expect)
        expect(response.isLeft(), isTrue);
        // expect(response, equals('Email inválido'));
      },
    );

    test(
      "deve retornar 'Email inválido' quando o dominio não for gmail, outlook ou hotmail",
      () async {},
    );

    test(
      "deve retornar 'Email inválido' quando o dominio não for gmail, outlook ou hotmail",
      () async {},
    );
  });
}
