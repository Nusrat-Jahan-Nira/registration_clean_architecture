import 'package:flutter/cupertino.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/model/user.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/usecase/register_user.dart';

class RegisterProvider extends ChangeNotifier{
  final RegisterUser _registerUser;
  String? _errorMessage;


  RegisterProvider(this._registerUser);
  String? get errorMessage => _errorMessage;


  Future<void> registerUser(String username, String email, String password) async {
    try {
      _errorMessage = null;
      notifyListeners();
      await _registerUser.execute(User(username: username, email: email, password: password));
      // Notify listeners or handle success
    } catch (e) {

      _errorMessage = e.toString();
      notifyListeners(); // Notify UI about the error
      // Handle registration failure
      throw e;
    }
  }
}