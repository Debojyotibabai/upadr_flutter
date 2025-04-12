part of 'create_new_password_bloc.dart';

@immutable
sealed class CreateNewPasswordEvent {}

final class CreateNewPassword extends CreateNewPasswordEvent {
  final CreateNewPasswordModel createNewPasswordModel;

  CreateNewPassword({required this.createNewPasswordModel});
}
