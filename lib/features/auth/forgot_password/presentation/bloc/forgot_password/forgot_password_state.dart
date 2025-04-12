part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordState {}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final String response;

  ForgotPasswordSuccess({required this.response});
}

final class ForgotPasswordError extends ForgotPasswordState {
  final String error;

  ForgotPasswordError({required this.error});
}
