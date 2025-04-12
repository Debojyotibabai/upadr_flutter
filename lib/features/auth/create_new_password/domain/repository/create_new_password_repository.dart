import 'package:either_dart/either.dart';
import 'package:upadr/models/create_new_password_model.dart';

abstract class CreateNewPasswordRepository {
  Future<Either<String, String>> createNewPassword(
      CreateNewPasswordModel createNewPasswordModel);
}
