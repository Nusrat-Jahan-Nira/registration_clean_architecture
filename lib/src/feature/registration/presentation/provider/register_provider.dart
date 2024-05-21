import 'package:flutter/cupertino.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/model/user.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/usecase/register_user.dart';

class RegisterProvider extends ChangeNotifier{
  final RegisterUser _registerUser;

  RegisterProvider(this._registerUser);

  Future<void> registerUser(String username, String email, String password) async {
    try {
      await _registerUser.execute(User(username: username, email: email, password: password));
      // Notify listeners or handle success
    } catch (e) {
      // Handle registration failure
      throw e;
    }
  }
}