import 'package:registration_clean_architecture/src/feature/registration/domain/model/user.dart';

abstract class UserRepository{

  Future<void> registerUser(User user);
}