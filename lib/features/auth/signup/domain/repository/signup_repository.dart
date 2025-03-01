import 'package:either_dart/either.dart';
import 'package:upadr/models/signup_with_email_and_password_model.dart';

abstract class SignupRepository {
  Future<Either<String, String>> signupWithEmailPassword(
    SignupWithEmailAndPasswordModel signupWithEmailAndPasswordModel,
  );
}
