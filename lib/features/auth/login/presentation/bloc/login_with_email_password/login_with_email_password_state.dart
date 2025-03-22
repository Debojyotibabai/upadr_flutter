part of 'login_with_email_password_bloc.dart';

@immutable
sealed class LoginWithEmailPasswordState {}

final class LoginWithEmailPasswordInitial extends LoginWithEmailPasswordState {}

final class LoginWithEmailPasswordLoading extends LoginWithEmailPasswordState {}

final class LoginWithEmailPasswordSuccess extends LoginWithEmailPasswordState {
  final LoginDataEntity response;

  LoginWithEmailPasswordSuccess(this.response);
}

final class LoginWithEmailPasswordFailure extends LoginWithEmailPasswordState {
  final String error;

  LoginWithEmailPasswordFailure(this.error);
}
