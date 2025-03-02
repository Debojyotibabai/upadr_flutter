import 'package:either_dart/either.dart';
import 'package:upadr/models/verify_email_model.dart';

abstract class VerifyEmailRepository {
  Future<Either<String, String>> verifyEmail(VerifyEmailModel verifyEmailModel);
}
