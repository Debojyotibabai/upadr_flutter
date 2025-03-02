import 'dart:developer';

import 'package:upadr/models/verify_email_model.dart';
import 'package:upadr/utils/api_services.dart';
import 'package:upadr/utils/endpoints.dart';

abstract class VerifyEmailDataSource {
  Future<String> verifyEmail(VerifyEmailModel verifyEmailModel);
}

class VerifyEmailDataSourceImpl implements VerifyEmailDataSource {
  @override
  Future<String> verifyEmail(VerifyEmailModel verifyEmailModel) async {
    try {
      final Map<String, String> formData = {
        "ConfirmationCode": verifyEmailModel.confirmationCode,
        "emailAddress": verifyEmailModel.emailAddress,
        "password": verifyEmailModel.password,
        "userType": verifyEmailModel.userType,
      };

      final response = await APIService.instance.request(
        Endpoints.verifyEmail,
        DioMethod.post,
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
