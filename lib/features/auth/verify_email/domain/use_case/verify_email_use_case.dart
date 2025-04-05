import 'package:either_dart/either.dart';
import 'package:upadr/config/use_case.dart';
import 'package:upadr/features/auth/verify_email/domain/repository/verify_email_repository.dart';
import 'package:upadr/models/verify_email_model.dart';

class VerifyEmailUseCase implements UseCase<String, String, VerifyEmailModel> {
  final VerifyEmailRepository verifyEmailRepositoryImpl;

  VerifyEmailUseCase({
    required this.verifyEmailRepositoryImpl,
  });

  @override
  Future<Either<String, String>> call(VerifyEmailModel verifyEmailModel) async {
    return await verifyEmailRepositoryImpl.verifyEmail(verifyEmailModel);
  }
}
