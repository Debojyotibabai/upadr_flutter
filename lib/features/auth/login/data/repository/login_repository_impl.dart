import 'package:either_dart/either.dart';
import 'package:upadr/features/auth/login/data/data_source/login_data_source.dart';
import 'package:upadr/features/auth/login/data/model/login_data_model.dart';
import 'package:upadr/features/auth/login/domain/repository/login_repository.dart';
import 'package:upadr/models/login_with_email_and_password_model.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSourceImpl;

  LoginRepositoryImpl({required this.loginDataSourceImpl});

  @override
  Future<Either<String, LoginDataModel>> loginWithEmailPassword(
      LoginWithEmailAndPasswordModel loginWithEmailAndPasswordModel) async {
    try {
      final response = await loginDataSourceImpl
          .loginWithEmailPassword(loginWithEmailAndPasswordModel);

      return Right(response);
    } catch (err) {
      return Left(err.toString());
    }
  }
}
