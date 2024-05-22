import 'package:flutter_test/flutter_test.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/repositoryImpl/user_repositoryImpl.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/model/user.dart';


void main() {
  group('UserRepositoryImpl', () {
    late UserRepositoryImpl userRepository;
    late User testUser;

    setUp(() {
      userRepository = UserRepositoryImpl();
      testUser = User( username: 'John Doe', email: 'johndoe@example.com',password: 'abc123456');
    });

    test('registerUser successfully registers a user', () async {
      // Act
      await userRepository.registerUser(testUser);

      // Assert
      // Since there's no actual persistence, we can't check a database or API response
      // Instead, we just ensure no exceptions were thrown and the method completes
      expect(true, isTrue);
    });
  });
}
