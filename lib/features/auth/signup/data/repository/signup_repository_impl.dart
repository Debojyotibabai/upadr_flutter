import 'package:either_dart/either.dart';
import 'package:upadr/features/auth/signup/data/data_source/signup_data_source.dart';
import 'package:upadr/features/auth/signup/domain/repository/signup_repository.dart';
import 'package:upadr/models/signup_with_email_and_password_model.dart';

class SignupRepositoryImpl implements SignupRepository {
  final SignupDataSource signupDataSourceImpl;

  SignupRepositoryImpl({
    required this.signupDataSourceImpl,
  });

  @override
  Future<Either<String, String>> signupWithEmailPassword(
      SignupWithEmailAndPasswordModel signupWithEmailAndPasswordModel) async {
    try {
      final response = await signupDataSourceImpl
          .signupWithEmailPassword(signupWithEmailAndPasswordModel);

      return Right(response);
    } catch (err) {
      return Left(err.toString());
    }
  }
}
