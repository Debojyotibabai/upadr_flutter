import 'package:either_dart/either.dart';
import 'package:upadr/config/use_case.dart';
import 'package:upadr/features/auth/login/domain/entity/login_data_entity.dart';
import 'package:upadr/features/auth/login/domain/repository/login_repository.dart';
import 'package:upadr/models/login_with_email_and_password_model.dart';

class LoginWithEmailPasswordUseCase
    implements
        UseCase<LoginDataEntity, String, LoginWithEmailAndPasswordModel> {
  final LoginRepository loginRepositoryImpl;

  LoginWithEmailPasswordUseCase({required this.loginRepositoryImpl});

  @override
  Future<Either<String, LoginDataEntity>> call(
      LoginWithEmailAndPasswordModel loginWithEmailAndPasswordModel) async {
    return await loginRepositoryImpl
        .loginWithEmailPassword(loginWithEmailAndPasswordModel);
  }
}
