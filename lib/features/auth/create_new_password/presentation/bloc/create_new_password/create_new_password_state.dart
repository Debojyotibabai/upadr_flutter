part of 'create_new_password_bloc.dart';

@immutable
sealed class CreateNewPasswordState {}

final class CreateNewPasswordInitial extends CreateNewPasswordState {}

final class CreateNewPasswordLoading extends CreateNewPasswordState {}

final class CreateNewPasswordSuccess extends CreateNewPasswordState {
  final String response;

  CreateNewPasswordSuccess({required this.response});
}

final class CreateNewPasswordError extends CreateNewPasswordState {
  final String error;

  CreateNewPasswordError({required this.error});
}
