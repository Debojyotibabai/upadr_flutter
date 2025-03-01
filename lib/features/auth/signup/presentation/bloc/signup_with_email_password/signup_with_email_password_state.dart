part of 'signup_with_email_password_bloc.dart';

@immutable
sealed class SignupWithEmailPasswordState {}

final class SignupWithEmailPasswordInitial
    extends SignupWithEmailPasswordState {}

final class SignupWithEmailPasswordLoading
    extends SignupWithEmailPasswordState {}

final class SignupWithEmailPasswordSuccess
    extends SignupWithEmailPasswordState {
  final String response;

  SignupWithEmailPasswordSuccess(this.response);
}

final class SignupWithEmailPasswordFailure
    extends SignupWithEmailPasswordState {
  final String error;

  SignupWithEmailPasswordFailure(this.error);
}
