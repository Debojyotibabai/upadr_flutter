import 'package:either_dart/either.dart';
import 'package:upadr/config/use_case.dart';
import 'package:upadr/features/auth/signup/domain/repository/signup_repository.dart';
import 'package:upadr/models/signup_with_email_and_password_model.dart';

class SignupWithEmailPasswordUseCase
    implements UseCase<String, String, SignupWithEmailAndPasswordModel> {
  final SignupRepository signupRepositoryImpl;

  SignupWithEmailPasswordUseCase({
    required this.signupRepositoryImpl,
  });
  @override
  Future<Either<String, String>> call(
      SignupWithEmailAndPasswordModel signupWithEmailAndPasswordModel) async {
    return await signupRepositoryImpl
        .signupWithEmailPassword(signupWithEmailAndPasswordModel);
  }
}
