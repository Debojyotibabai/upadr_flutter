import 'package:either_dart/either.dart';
import 'package:upadr/models/forgot_password_model.dart';

abstract class ForgotPasswordRepository {
  Future<Either<String, String>> forgotPassword(
      ForgotPasswordModel forgotPasswordModel);
}
