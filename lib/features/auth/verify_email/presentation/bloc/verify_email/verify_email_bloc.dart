import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:upadr/features/auth/verify_email/presentation/use_case/verify_email_use_case.dart';
import 'package:upadr/models/verify_email_model.dart';

part 'verify_email_event.dart';
part 'verify_email_state.dart';

class VerifyEmailBloc extends Bloc<VerifyEmailEvent, VerifyEmailState> {
  final VerifyEmailUseCase verifyEmailUseCase;

  VerifyEmailBloc({
    required this.verifyEmailUseCase,
  }) : super(VerifyEmailInitial()) {
    on<VerifyEmail>(
      (event, emit) async {
        emit(VerifyEmailLoading());

        final response = await verifyEmailUseCase(event.verifyEmailModel);

        response.fold(
          (err) => emit(VerifyEmailFailure(err)),
          (res) => emit(VerifyEmailSuccess(res)),
        );
      },
    );
  }
}
