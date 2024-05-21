import 'package:registration_clean_architecture/src/feature/registration/domain/model/user.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  @override
  Future<void> registerUser(User user) async {
    // Simulate network call or database interaction
    await Future.delayed(const Duration(seconds: 2));
    // Normally, you would handle actual registration logic here
  }

}