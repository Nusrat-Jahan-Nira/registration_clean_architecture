import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/data_source/remote/user_remote_data_source.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/repositoryImpl/user_repositoryImpl.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/repository/user_repository.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/usecase/get_registration.dart';
import 'package:registration_clean_architecture/src/feature/registration/domain/usecase/register_user.dart';
import 'package:registration_clean_architecture/src/feature/registration/presentation/provider/register_provider.dart';
import 'package:http/http.dart' as http;


List<SingleChildWidget> providers = [

  // Provider<UserRepository>(create: (_)=> UserRepositoryImpl()),
  // ProxyProvider<UserRepository, RegisterUser>(update: (_,userRepository,__) => RegisterUser(userRepository)),
  // ChangeNotifierProxyProvider<RegisterUser, RegisterProvider>(
  //     create: (_)=> RegisterProvider(RegisterUser(UserRepositoryImpl())),
  //     update:(_,registerUser,__) => RegisterProvider(registerUser),
  // )

  // Provider<UserRepository>(create: (_) => UserRepositoryImpl()),
  // ProxyProvider<UserRepository, RegisterUser>(
  //   update: (_, userRepository, __) => RegisterUser(userRepository),
  // ),
  // ProxyProvider<UserRepository, GetRegistration>(
  //   update: (_, userRepository, __) => GetRegistration(userRepository),
  // ),
  // ChangeNotifierProxyProvider2<RegisterUser, GetRegistration, RegisterProvider>(
  //   create: (_) => RegisterProvider(
  //       RegisterUser(UserRepositoryImpl()),
  //       GetRegistration(UserRepositoryImpl())
  //   ),
  //   update: (_, registerUser, getRegistration, __) => RegisterProvider(
  //     registerUser,
  //     getRegistration,
  //   ),
  // ),

  Provider<http.Client>(create: (_) => http.Client()),

  ProxyProvider<http.Client, UserRemoteDataSource>(
    update: (_, client, __) => UserRemoteDataSourceImpl(client: client),
  ),

  //
  // Provider<UserRemoteDataSource>(create: (_) => UserRemoteDataSourceImpl(client: client)),

  ProxyProvider<UserRemoteDataSource, UserRepository>(
    update: (_, remoteDataSource, __) => UserRepositoryImpl(remoteDataSource),
  ),

  ProxyProvider<UserRepository, RegisterUser>(
    update: (_, userRepository, __) => RegisterUser(userRepository),
  ),

  ProxyProvider<UserRepository, GetRegistration>(
    update: (_, userRepository, __) => GetRegistration(userRepository),
  ),

  // ChangeNotifierProxyProvider2<RegisterUser, GetRegistration, RegisterProvider>(
  //   create: (_) => RegisterProvider(
  //       RegisterUser(UserRepositoryImpl(UserRepositoryImpl())),
  //       GetRegistration(UserRepositoryImpl(UserRepositoryImpl()))
  //   ),
  //   update: (_, registerUser, anotherUseCase, __) => RegisterProvider(
  //     registerUser,
  //     anotherUseCase,
  //   ),
  // ),
  ChangeNotifierProxyProvider2<RegisterUser, GetRegistration, RegisterProvider>(
    create: (context) => RegisterProvider(
      Provider.of<RegisterUser>(context, listen: false),
      Provider.of<GetRegistration>(context, listen: false),
    ),
    update: (_, registerUser, getRegistration, __) => RegisterProvider(
      registerUser,
      getRegistration,
    ),
  ),

];