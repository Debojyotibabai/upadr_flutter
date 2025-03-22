import 'dart:convert';

import 'package:upadr/features/auth/login/data/model/login_data_model.dart';
import 'package:upadr/models/login_with_email_and_password_model.dart';
import 'package:upadr/utils/api_services.dart';
import 'package:upadr/utils/endpoints.dart';

abstract class LoginDataSource {
  Future<LoginDataModel> loginWithEmailPassword(
      LoginWithEmailAndPasswordModel loginWithEmailAndPasswordModel);
}

class LoginDataSourceImpl implements LoginDataSource {
  @override
  Future<LoginDataModel> loginWithEmailPassword(
      LoginWithEmailAndPasswordModel loginWithEmailAndPasswordModel) async {
    try {
      final formData = {
        "emailAddress": loginWithEmailAndPasswordModel.emailAddress,
        "password": loginWithEmailAndPasswordModel.password,
        "userType": loginWithEmailAndPasswordModel.userType,
      };

      final response = await APIService.instance.request(
        Endpoints.login,
        DioMethod.post,
        formData: formData,
        contentType: ContentType.json,
      );

      return loginDataModelFromJson(jsonEncode(response.data));
    } catch (err, s) {
      print(err.toString() + s.toString());
      throw (err as Map<String, dynamic>)["message"]!;
    }
  }
}
