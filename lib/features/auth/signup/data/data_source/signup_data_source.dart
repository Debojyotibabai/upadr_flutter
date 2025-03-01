import 'dart:developer';

import 'package:upadr/models/signup_with_email_and_password_model.dart';
import 'package:upadr/utils/api_services.dart';
import 'package:upadr/utils/endpoints.dart';

abstract class SignupDataSource {
  Future<String> signupWithEmailPassword(
    SignupWithEmailAndPasswordModel signupWithEmailAndPasswordModal,
  );
}

class SignupDataSourceImpl implements SignupDataSource {
  @override
  Future<String> signupWithEmailPassword(
    SignupWithEmailAndPasswordModel signupWithEmailAndPasswordModel,
  ) async {
    try {
      final Map<String, String> formData = {
        "confirmPassword": signupWithEmailAndPasswordModel.confirmPassword,
        "emailAddress": signupWithEmailAndPasswordModel.emailAddress,
        "firstName": signupWithEmailAndPasswordModel.firstName,
        "lastName": signupWithEmailAndPasswordModel.lastName,
        "password": signupWithEmailAndPasswordModel.password,
        "userType": signupWithEmailAndPasswordModel.userType,
      };

      final response = await APIService.instance.request(
        Endpoints.register,
        DioMethod.post,
        formData: formData,
        contentType: ContentType.json,
      );

      return response.data["message"];
    } catch (err, s) {
      log(err.toString() + s.toString());
      throw err.toString();
    }
  }
}
