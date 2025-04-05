import 'package:either_dart/either.dart';
import 'package:upadr/features/auth/verify_email/data/data_source/resend_otp_data_source.dart';
import 'package:upadr/features/auth/verify_email/domain/repository/resend_otp_repository.dart';
import 'package:upadr/models/resend_otp_model.dart';

class ResendOtpRepositoryImpl implements ResendOtpRepository {
  final ResendOtpDataSource resendOtpDataSourceImpl;

  ResendOtpRepositoryImpl({
    required this.resendOtpDataSourceImpl,
  });

  @override
  Future<Either<String, String>> resendOtp(
      ResendOtpModel resendOtpModel) async {
    try {
      final response = await resendOtpDataSourceImpl.resendOtp(resendOtpModel);

      return Right(response);
    } catch (err) {
      return Left(err.toString());
    }
  }
}
