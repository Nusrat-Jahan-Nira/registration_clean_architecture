import 'package:flutter_test/flutter_test.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Request/user_req_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Response/user_res_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/entity/user.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/repository/user_repository.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/usecase/register_user.dart';

// Create a mock class for UserRepository
class MockUserRepository implements UserRepository {
  bool registerUserCalled = false;

  @override
  Future<void> registerUser(User user) async {
    // Simulate registration logic
    registerUserCalled = true;
    // You can also add more complex logic or assertions here if needed
  }

  @override
  Future<UserResModel> getRegistration(UserReqModel reqModel) {
    // TODO: implement getRegistration
    throw UnimplementedError();
  }
}

void main() {
  group('RegisterUser', () {
    late RegisterUser registerUser;
    late MockUserRepository mockUserRepository;

    setUp(() {
      mockUserRepository = MockUserRepository();
      registerUser = RegisterUser(mockUserRepository);
    });

    test('execute method calls registerUser on UserRepository', () async {
      // Arrange
      final user = User( username: 'John Doe', email: 'johndoe@example.com',password: 'abc123456');

      // Act
      await registerUser.execute(user);

      // Assert
      // Verify that registerUserCalled flag is set to true after calling execute method
      expect(mockUserRepository.registerUserCalled, true);
    });
    test('execute method throws an exception when user is invalid', () async {
      // Arrange
      final invalidUser =User( username: '', email: '',password: ''); // Invalid user

      // Act & Assert
      expect(() => registerUser.execute(invalidUser), throwsException);
    });

    test('execute method throws an exception when user is invalid', () async {
      // Arrange
      final invalidUser =User( username: 'John Doe', email: '',password: ''); // Invalid user

      // Act & Assert
      expect(() => registerUser.execute(invalidUser), throwsException);
    });

    test('execute method throws an exception when user is invalid', () async {
      // Arrange
      final invalidUser =User( username: '', email: 'johndoe@example.com',password: ''); // Invalid user

      // Act & Assert
      expect(() => registerUser.execute(invalidUser), throwsException);
    });

    test('execute method throws an exception when user is invalid', () async {
      // Arrange
      final invalidUser =User( username: '', email: '',password: 'abc123456'); // Invalid user

      // Act & Assert
      expect(() => registerUser.execute(invalidUser), throwsException);
    });

    test('execute method throws an exception when user is invalid', () async {
      // Arrange
      final invalidUser =User( username: 'John Doe', email: 'johndoe@example.com',password: '123'); // Invalid user

      // Act & Assert
      expect(() => registerUser.execute(invalidUser), throwsException);
    });

  });
}
