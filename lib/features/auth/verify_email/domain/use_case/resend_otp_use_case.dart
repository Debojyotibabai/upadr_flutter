import 'package:either_dart/either.dart';
import 'package:upadr/config/use_case.dart';
import 'package:upadr/features/auth/verify_email/domain/repository/resend_otp_repository.dart';
import 'package:upadr/models/resend_otp_model.dart';

class ResendOtpUseCase implements UseCase<String, String, ResendOtpModel> {
  final ResendOtpRepository resendOtpRepositoryImpl;

  ResendOtpUseCase({
    required this.resendOtpRepositoryImpl,
  });

  @override
  Future<Either<String, String>> call(ResendOtpModel resendOtpModel) async {
    return await resendOtpRepositoryImpl.resendOtp(resendOtpModel);
  }
}
