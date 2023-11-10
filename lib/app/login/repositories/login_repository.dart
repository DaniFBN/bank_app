import '../../services/local_storage/i_local_storage.dart';

class LoginRepository {
  const LoginRepository(this._localStorage);

  final ILocalStorage _localStorage;

  Future<bool> login(String email, String password) async {
    final users = await _localStorage.get('users');

    for (final user in users) {
      if (user['email'] == email) {
        if (user['password'] == password) return true;
        return false;
      }
    }

    return false;
  }
}
