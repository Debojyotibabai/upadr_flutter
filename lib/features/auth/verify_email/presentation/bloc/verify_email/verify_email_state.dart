part of 'verify_email_bloc.dart';

@immutable
sealed class VerifyEmailState {}

final class VerifyEmailInitial extends VerifyEmailState {}

final class VerifyEmailLoading extends VerifyEmailState {}

final class VerifyEmailSuccess extends VerifyEmailState {
  final String response;

  VerifyEmailSuccess(this.response);
}

final class VerifyEmailFailure extends VerifyEmailState {
  final String error;

  VerifyEmailFailure(this.error);
}
