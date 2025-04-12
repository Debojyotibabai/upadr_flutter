part of 'forgot_password_bloc.dart';

@immutable
sealed class ForgotPasswordEvent {}

final class ForgotPassword extends ForgotPasswordEvent {
  final ForgotPasswordModel forgotPasswordModel;

  ForgotPassword({required this.forgotPasswordModel});
}
