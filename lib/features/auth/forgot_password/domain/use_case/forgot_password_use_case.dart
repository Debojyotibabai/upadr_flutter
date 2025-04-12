import 'package:either_dart/either.dart';
import 'package:upadr/config/use_case.dart';
import 'package:upadr/features/auth/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:upadr/models/forgot_password_model.dart';

class ForgotPasswordUseCase
    implements UseCase<String, String, ForgotPasswordModel> {
  final ForgotPasswordRepository forgotPasswordRepositoryImpl;

  ForgotPasswordUseCase({required this.forgotPasswordRepositoryImpl});

  @override
  Future<Either<String, String>> call(
      ForgotPasswordModel forgotPasswordModel) async {
    return await forgotPasswordRepositoryImpl
        .forgotPassword(forgotPasswordModel);
  }
}
