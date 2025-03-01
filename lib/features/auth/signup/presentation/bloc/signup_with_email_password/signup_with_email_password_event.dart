part of 'signup_with_email_password_bloc.dart';

@immutable
sealed class SignupWithEmailPasswordEvent {}

final class SignupWithEmailPassword extends SignupWithEmailPasswordEvent {
  final SignupWithEmailAndPasswordModel signupWithEmailAndPasswordModel;

  SignupWithEmailPassword(this.signupWithEmailAndPasswordModel);
}
