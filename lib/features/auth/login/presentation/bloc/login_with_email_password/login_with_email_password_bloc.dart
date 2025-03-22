import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:upadr/features/auth/login/domain/entity/login_data_entity.dart';
import 'package:upadr/features/auth/login/domain/use_case/login_with_email_password_use_case.dart';
import 'package:upadr/models/login_with_email_and_password_model.dart';

part 'login_with_email_password_event.dart';
part 'login_with_email_password_state.dart';

class LoginWithEmailPasswordBloc
    extends Bloc<LoginWithEmailPasswordEvent, LoginWithEmailPasswordState> {
  final LoginWithEmailPasswordUseCase loginWithEmailPasswordUseCase;

  LoginWithEmailPasswordBloc({required this.loginWithEmailPasswordUseCase})
      : super(LoginWithEmailPasswordInitial()) {
    on<LoginWithEmailPassword>((event, emit) async {
      emit(LoginWithEmailPasswordLoading());

      final response = await loginWithEmailPasswordUseCase(
        LoginWithEmailAndPasswordModel(
          emailAddress: event.loginWithEmailAndPasswordModel.emailAddress,
          password: event.loginWithEmailAndPasswordModel.password,
        ),
      );

      response.fold(
        (err) => emit(LoginWithEmailPasswordFailure(err)),
        (res) => emit(LoginWithEmailPasswordSuccess(res)),
      );
    });
  }
}
