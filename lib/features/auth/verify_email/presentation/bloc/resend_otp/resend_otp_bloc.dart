import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:upadr/features/auth/verify_email/domain/use_case/resend_otp_use_case.dart';
import 'package:upadr/models/resend_otp_model.dart';

part 'resend_otp_event.dart';
part 'resend_otp_state.dart';

class ResendOtpBloc extends Bloc<ResendOtpEvent, ResendOtpState> {
  final ResendOtpUseCase resendOtpUseCase;

  ResendOtpBloc({required this.resendOtpUseCase}) : super(ResendOtpInitial()) {
    on<ResendOtp>((event, emit) async {
      emit(ResendOtpLoading());

      final response = await resendOtpUseCase(event.resendOtpModel);

      response.fold(
        (err) => emit(ResendOtpFailure(error: err)),
        (res) => emit(ResendOtpSuccess(response: res)),
      );
    });
  }
}
