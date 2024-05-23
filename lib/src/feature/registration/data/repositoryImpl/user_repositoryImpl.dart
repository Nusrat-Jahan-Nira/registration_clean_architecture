import 'package:registration_clean_architecture/src/feature/registration/data/data_source/remote/user_remote_data_source.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Request/user_req_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Response/user_res_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/entity/user.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository{

  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> registerUser(User user) async {
    // Simulate network call or database interaction
    await Future.delayed(const Duration(seconds: 2));
    // Normally, you would handle actual registration logic here
  }

  @override
  Future<UserResModel> getRegistration(UserReqModel reqModel) async {
    final userModel = await remoteDataSource.getRegistration(reqModel);
    return userModel;
  }

}