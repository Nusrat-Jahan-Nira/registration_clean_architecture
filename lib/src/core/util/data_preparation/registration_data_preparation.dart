
import 'package:registration_clean_architecture/src/feature/registration/data/model/Request/user_req_model.dart';

class RegistrationDataPreparation {
  static Map<String, dynamic> prepareRegistrationPostData(UserReqModel model) {
    return {
      'username': model.username,
      'email': model.email,
      'password': model.password
    };
  }
}
