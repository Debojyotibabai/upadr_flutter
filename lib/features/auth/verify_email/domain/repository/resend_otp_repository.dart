import 'package:either_dart/either.dart';
import 'package:upadr/models/resend_otp_model.dart';

abstract class ResendOtpRepository {
  Future<Either<String, String>> resendOtp(ResendOtpModel resendOtpModel);
}
