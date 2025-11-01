import '../data/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  bool call(String username, String password) {
    return repository.login(username, password);
  }
}
