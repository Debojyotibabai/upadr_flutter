part of 'resend_otp_bloc.dart';

@immutable
sealed class ResendOtpEvent {}

final class ResendOtp extends ResendOtpEvent {
  final ResendOtpModel resendOtpModel;

  ResendOtp({
    required this.resendOtpModel,
  });
}
