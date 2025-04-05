part of 'resend_otp_bloc.dart';

@immutable
sealed class ResendOtpState {}

final class ResendOtpInitial extends ResendOtpState {}

final class ResendOtpLoading extends ResendOtpState {}

final class ResendOtpSuccess extends ResendOtpState {
  final String response;

  ResendOtpSuccess({
    required this.response,
  });
}

final class ResendOtpFailure extends ResendOtpState {
  final String error;

  ResendOtpFailure({
    required this.error,
  });
}
