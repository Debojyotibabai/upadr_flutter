import 'package:either_dart/either.dart';
import 'package:upadr/features/auth/verify_email/data/data_source/verify_email_data_source.dart';
import 'package:upadr/features/auth/verify_email/domain/repository/verify_email_repository.dart';
import 'package:upadr/models/verify_email_model.dart';

class VerifyEmailRepositoryImpl implements VerifyEmailRepository {
  final VerifyEmailDataSource verifyEmailDataSourceImpl;

  VerifyEmailRepositoryImpl({
    required this.verifyEmailDataSourceImpl,
  });

  @override
  Future<Either<String, String>> verifyEmail(
      VerifyEmailModel verifyEmailModel) async {
    try {
      final response =
          await verifyEmailDataSourceImpl.verifyEmail(verifyEmailModel);

      return Right(response);
    } catch (err) {
      return Left(err.toString());
    }
  }
}
