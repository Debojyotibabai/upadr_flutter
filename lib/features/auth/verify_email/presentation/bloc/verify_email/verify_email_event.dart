part of 'verify_email_bloc.dart';

@immutable
sealed class VerifyEmailEvent {}

final class VerifyEmail extends VerifyEmailEvent {
  final VerifyEmailModel verifyEmailModel;

  VerifyEmail(this.verifyEmailModel);
}
