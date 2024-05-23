

import 'package:registration_clean_architecture/src/feature/registration/data/model/Request/user_req_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Response/user_res_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/entity/user.dart';

abstract class UserRepository{

  Future<void> registerUser(User user);

  Future<UserResModel> getRegistration(UserReqModel reqModel);
}