import '../../../../core/shared/services/local_storage/i_local_storage.dart';
import '../register_param.dart';

class RegisterRepository {
  final ILocalStorage _localStorage;

  const RegisterRepository(this._localStorage);

  Future<bool> register(RegisterParam param) async {
    await Future.delayed(const Duration(seconds: 2));

    final personId = await _localStorage.save(
      'persons',
      {
        'nome': param.name,
        'telefone': param.phone,
        'endereco': {
          'rua': param.street,
          'numero': param.number,
          'bairro': param.neighborhood,
          'cep': param.cep,
          'cidade': param.city,
          'estado': param.state,
        },
      },
    );

    final userId = await _localStorage.save('users', {
      'email': param.email,
      'senha': param.password,
      'pessoaId': personId,
    });

    return true;
  }
}
