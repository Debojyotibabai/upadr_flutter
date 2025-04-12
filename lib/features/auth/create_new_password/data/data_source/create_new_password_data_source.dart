import 'dart:developer';

import 'package:upadr/models/create_new_password_model.dart';
import 'package:upadr/utils/api_services.dart';
import 'package:upadr/utils/endpoints.dart';

abstract class CreateNewPasswordDataSource {
  Future<String> createNewPassword(
      CreateNewPasswordModel createNewPasswordModel);
}

class CreateNewPasswordDataSourceImpl implements CreateNewPasswordDataSource {
  @override
  Future<String> createNewPassword(
      CreateNewPasswordModel createNewPasswordModel) async {
    try {
      final formData = {
        "confirmPassword": createNewPasswordModel.confirmPassword,
        "emailAddress": createNewPasswordModel.emailAddress,
        "newPassword": createNewPasswordModel.newPassword,
        "resetCode": createNewPasswordModel.resetCode,
        "userType": createNewPasswordModel.userType,
      };

      final response = await APIService.instance.request(
        Endpoints.createNewPassword,
        DioMethod.patch,
        formData: formData,
        contentType: ContentType.json,
      );

      return response.data["message"];
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw (err as Map<String, dynamic>)["message"]!;
    }
  }
}
