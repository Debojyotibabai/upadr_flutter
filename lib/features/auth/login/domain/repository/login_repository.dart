import 'package:either_dart/either.dart';
import 'package:upadr/features/auth/login/domain/entity/login_data_entity.dart';
import 'package:upadr/models/login_with_email_and_password_model.dart';

abstract class LoginRepository {
  Future<Either<String, LoginDataEntity>> loginWithEmailPassword(
      LoginWithEmailAndPasswordModel loginWithEmailAndPasswordModel);
}
