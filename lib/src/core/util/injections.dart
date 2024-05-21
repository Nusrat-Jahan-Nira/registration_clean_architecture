import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/repositoryImpl/user_repositoryImpl.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/repository/user_repository.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/usecase/register_user.dart';
import 'package:registration_clean_architecture/src/feature/registration/presentation/provider/register_provider.dart';

List<SingleChildWidget> providers = [

  Provider<UserRepository>(create: (_)=> UserRepositoryImpl()),
  ProxyProvider<UserRepository, RegisterUser>(update: (_,userRepository,__) => RegisterUser(userRepository)),
  ChangeNotifierProxyProvider<RegisterUser, RegisterProvider>(
      create: (_)=> RegisterProvider(RegisterUser(UserRepositoryImpl())),
      update:(_,registerUser,__) => RegisterProvider(registerUser),
  )



];