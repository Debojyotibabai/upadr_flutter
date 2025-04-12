import 'dart:developer';

import 'package:upadr/models/forgot_password_model.dart';
import 'package:upadr/utils/api_services.dart';
import 'package:upadr/utils/endpoints.dart';

abstract class ForgotPasswordDataSource {
  Future<String> forgotPassword(ForgotPasswordModel forgotPasswordModel);
}

class ForgotPasswordDataSourceImpl implements ForgotPasswordDataSource {
  @override
  Future<String> forgotPassword(ForgotPasswordModel forgotPasswordModel) async {
    try {
      final formData = {
        "emailAddress": forgotPasswordModel.emailAddress,
        "userType": forgotPasswordModel.userType,
      };

      final response = await APIService.instance.request(
        Endpoints.forgotPassword,
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
