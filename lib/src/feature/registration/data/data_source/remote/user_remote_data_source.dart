import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:registration_clean_architecture/src/core/constant/api_constants.dart';
import 'package:registration_clean_architecture/src/core/util/data_preparation/registration_data_preparation.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Request/user_req_model.dart';
import 'package:registration_clean_architecture/src/feature/registration/data/model/Response/user_res_model.dart';


abstract class UserRemoteDataSource {
  Future<UserResModel> getRegistration(UserReqModel reqModel);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserResModel> getRegistration(UserReqModel reqModel) async {

    final postData = RegistrationDataPreparation.prepareRegistrationPostData(reqModel);
    final headers = {
      'Content-Type': ApiConstants.contentType,
    };

    final response = await client.post(
      Uri.parse('${ApiConstants.baseUrl}${ApiConstants.postRegisterEndpoint}'),
      headers: headers,
      body: jsonEncode(postData),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> json = jsonDecode(response.body);
      return UserResModel.fromJson(json);
    } else {
      throw Exception('Failed to load users');
    }
  }
}
