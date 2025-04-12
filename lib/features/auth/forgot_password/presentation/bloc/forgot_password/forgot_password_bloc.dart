import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:upadr/features/auth/forgot_password/domain/use_case/forgot_password_use_case.dart';
import 'package:upadr/models/forgot_password_model.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordBloc({required this.forgotPasswordUseCase})
      : super(ForgotPasswordInitial()) {
    on<ForgotPassword>((event, emit) async {
      emit(ForgotPasswordLoading());

      final response = await forgotPasswordUseCase(event.forgotPasswordModel);

      response.fold(
        (err) => emit(ForgotPasswordError(error: err)),
        (res) => emit(ForgotPasswordSuccess(response: res)),
      );
    });
  }
}
