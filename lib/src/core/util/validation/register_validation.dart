import 'package:registration_clean_architecture/src/core/network/error/registration_exception.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/entity/user.dart';

void isUserValid(User user) {
  if (user.username.isEmpty) {
    throw RegistrationException('Username cannot be empty');
  }
  if (user.email.isEmpty || !_isValidEmail(user.email)) {
    throw RegistrationException('Invalid email address');
  }
  if (user.password.isEmpty || user.password.length < 6) {
    throw RegistrationException('Password must be at least 6 characters long');
  }

}

bool _isValidEmail(String email) {
  // Simple email validation using regex
  final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return regex.hasMatch(email);
}