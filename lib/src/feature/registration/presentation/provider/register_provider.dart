import 'package:flutter/cupertino.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Request/user_req_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Response/user_res_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/entity/user.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/usecase/get_registration.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/usecase/register_user.dart';

class RegisterProvider extends ChangeNotifier{
  final RegisterUser _registerUser;
  final GetRegistration _getRegistration;

  String? _errorMessage;
  bool _isLoading = false;
  UserResModel? _resData;


  RegisterProvider(this._registerUser,this._getRegistration);
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;
  UserResModel? get resData => _resData;


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

  Future<void> getRegistration(String username, String email, String password) async {
    try {
      _errorMessage = null;
      _isLoading = true;
      notifyListeners();

      _resData = await _getRegistration.execute(UserReqModel(username: username, email: email, password: password));

      print(_resData?.outCode.toString());

      if(_resData?.outCode == "1"){
        _errorMessage = _resData?.outMessage;
      }

      _isLoading = false;
      notifyListeners();

      // Notify listeners or handle success
    } catch (e) {

      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners(); // Notify UI about the error
      // Handle registration failure
      rethrow;
    }
  }


}