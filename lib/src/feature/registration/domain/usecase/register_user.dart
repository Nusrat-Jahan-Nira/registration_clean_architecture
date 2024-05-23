import 'package:registration_clean_architecture/src/core/network/error/registration_exception.dart';
import 'package:registration_clean_architecture/src/core/util/validation/register_validation.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/entity/user.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/repository/user_repository.dart';

import '../../../../core/util/validation/register_validation.dart';

class RegisterUser{

  final UserRepository userRepository;

  RegisterUser(this.userRepository);

  Future<void> execute(User user)async {
    isUserValid(user);

    try {
      await userRepository.registerUser(user);
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }



}