import 'package:registration_clean_architecture/src/core/util/validation/register_validation.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Request/user_req_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Response/user_res_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/repository/user_repository.dart';


class GetRegistration {
  final UserRepository repository;

  GetRegistration(this.repository);

  Future<UserResModel> execute(UserReqModel reqModel) async {

    try {
      return await repository.getRegistration(reqModel);
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }

  }
}
