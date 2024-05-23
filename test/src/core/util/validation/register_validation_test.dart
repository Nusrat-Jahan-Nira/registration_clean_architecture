import 'package:flutter_test/flutter_test.dart';
import 'package:registration_clean_architecture/src/core/network/error/registration_exception.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/entity/user.dart';
import 'package:registration_clean_architecture/src/core/util/validation/register_validation.dart';

void main() {
  test('isUserValid throws exception when username is empty', () {
    // Arrange
    final user = User(username: '', email: 'test@example.com', password: 'password');

    // Act & Assert
    expect(() => isUserValid(user), throwsA(isA<RegistrationException>()));
  });

  test('isUserValid throws exception when email is invalid', () {
    // Arrange
    final user = User(username: 'testuser', email: 'invalidemail', password: 'password');

    // Act & Assert
    expect(() => isUserValid(user), throwsA(isA<RegistrationException>()));
  });

  test('isUserValid throws exception when email is empty', () {
    // Arrange
    final user = User(username: 'testuser', email: '', password: 'password');

    // Act & Assert
    expect(() => isUserValid(user), throwsA(isA<RegistrationException>()));
  });

  test('isUserValid throws exception when password is too short', () {
    // Arrange
    final user = User(username: 'testuser', email: 'test@example.com', password: '12345');

    // Act & Assert
    expect(() => isUserValid(user), throwsA(isA<RegistrationException>()));
  });

  test('isUserValid does not throw exception when user is valid', () {
    // Arrange
    final user = User(username: 'testuser', email: 'test@example.com', password: 'securepassword');

    // Act & Assert
    expect(() => isUserValid(user), returnsNormally);
  });
}
