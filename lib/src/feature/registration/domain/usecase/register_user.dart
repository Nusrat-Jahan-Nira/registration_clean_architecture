import 'package:registration_clean_architecture/src/feature/registration/domain/model/user.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/repository/user_repository.dart';

class RegisterUser{

  final UserRepository userRepository;

  RegisterUser(this.userRepository);

  Future<void> execute(User user)async {
    if (!_isUserValid(user)) {
      throw Exception('Invalid user data');
    }
    try {
      await userRepository.registerUser(user);
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  bool _isUserValid(User user) {
    return user.username.isNotEmpty && user.email.isNotEmpty && user.password.isNotEmpty;
  }

}