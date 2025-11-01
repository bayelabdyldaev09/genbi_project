import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final String correctUsername = 'admin';
  final String correctPassword = '12345';

  @override
  bool login(String username, String password) {
    return username == correctUsername && password == correctPassword;
  }
}
