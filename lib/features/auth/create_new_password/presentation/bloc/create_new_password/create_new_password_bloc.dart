import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:upadr/features/auth/create_new_password/domain/use_case/create_new_password_use_case.dart';
import 'package:upadr/models/create_new_password_model.dart';

part 'create_new_password_event.dart';
part 'create_new_password_state.dart';

class CreateNewPasswordBloc
    extends Bloc<CreateNewPasswordEvent, CreateNewPasswordState> {
  final CreateNewPasswordUseCase createNewPasswordUseCase;

  CreateNewPasswordBloc({required this.createNewPasswordUseCase})
      : super(CreateNewPasswordInitial()) {
    on<CreateNewPassword>((event, emit) async {
      emit(CreateNewPasswordLoading());

      final response =
          await createNewPasswordUseCase(event.createNewPasswordModel);

      response.fold(
        (err) => emit(CreateNewPasswordError(error: err)),
        (res) => emit(CreateNewPasswordSuccess(response: res)),
      );
    });
  }
}
