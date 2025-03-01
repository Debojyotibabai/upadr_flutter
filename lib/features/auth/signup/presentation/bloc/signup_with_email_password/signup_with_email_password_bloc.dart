import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:upadr/features/auth/signup/domain/use_case/signup_with_email_password_use_case.dart';
import 'package:upadr/models/signup_with_email_and_password_model.dart';

part 'signup_with_email_password_event.dart';
part 'signup_with_email_password_state.dart';

class SignupWithEmailPasswordBloc
    extends Bloc<SignupWithEmailPasswordEvent, SignupWithEmailPasswordState> {
  final SignupWithEmailPasswordUseCase signupWithEmailPasswordUseCase;

  SignupWithEmailPasswordBloc({
    required this.signupWithEmailPasswordUseCase,
  }) : super(SignupWithEmailPasswordInitial()) {
    on<SignupWithEmailPassword>(
      (event, emit) async {
        emit(SignupWithEmailPasswordLoading());

        final response = await signupWithEmailPasswordUseCase(
          event.signupWithEmailAndPasswordModel,
        );

        response.fold(
          (err) => emit(SignupWithEmailPasswordFailure(err)),
          (res) => emit(SignupWithEmailPasswordSuccess(res)),
        );
      },
    );
  }
}
