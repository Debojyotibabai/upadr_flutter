import 'package:either_dart/either.dart';
import 'package:upadr/features/auth/forgot_password/data/data_source/forgot_password_data_source.dart';
import 'package:upadr/features/auth/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:upadr/models/forgot_password_model.dart';

class ForgotPasswordRepositoryImpl implements ForgotPasswordRepository {
  final ForgotPasswordDataSource forgotPasswordDataSourceImpl;

  ForgotPasswordRepositoryImpl({required this.forgotPasswordDataSourceImpl});

  @override
  Future<Either<String, String>> forgotPassword(
      ForgotPasswordModel forgotPasswordModel) async {
    try {
      final response = await forgotPasswordDataSourceImpl
          .forgotPassword(forgotPasswordModel);

      return Right(response);
    } catch (err) {
      return Left(err.toString());
    }
  }
}
