part of 'login_with_email_password_bloc.dart';

@immutable
sealed class LoginWithEmailPasswordEvent {}

final class LoginWithEmailPassword extends LoginWithEmailPasswordEvent {
  final LoginWithEmailAndPasswordModel loginWithEmailAndPasswordModel;

  LoginWithEmailPassword(this.loginWithEmailAndPasswordModel);
}
