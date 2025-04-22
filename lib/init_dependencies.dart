import 'package:get_it/get_it.dart';
import 'package:upadr/features/app/my_procedure/data/data_source/procedure_data_source.dart';
import 'package:upadr/features/app/my_procedure/data/repository/procedure_repository_impl.dart';
import 'package:upadr/features/app/my_procedure/domain/repository/procedure_repository.dart';
import 'package:upadr/features/app/my_procedure/domain/use_case/get_all_procedure_use_case.dart';
import 'package:upadr/features/app/my_procedure/presentation/bloc/get_all_procedure/get_all_procedure_bloc.dart';
import 'package:upadr/features/auth/create_new_password/data/data_source/create_new_password_data_source.dart';
import 'package:upadr/features/auth/create_new_password/data/repository/create_new_password_repository_impl.dart';
import 'package:upadr/features/auth/create_new_password/domain/repository/create_new_password_repository.dart';
import 'package:upadr/features/auth/create_new_password/domain/use_case/create_new_password_use_case.dart';
import 'package:upadr/features/auth/create_new_password/presentation/bloc/create_new_password/create_new_password_bloc.dart';
import 'package:upadr/features/auth/forgot_password/data/data_source/forgot_password_data_source.dart';
import 'package:upadr/features/auth/forgot_password/data/repository/forgot_password_repository_impl.dart';
import 'package:upadr/features/auth/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:upadr/features/auth/forgot_password/domain/use_case/forgot_password_use_case.dart';
import 'package:upadr/features/auth/forgot_password/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:upadr/features/auth/login/data/data_source/login_data_source.dart';
import 'package:upadr/features/auth/login/data/repository/login_repository_impl.dart';
import 'package:upadr/features/auth/login/domain/repository/login_repository.dart';
import 'package:upadr/features/auth/login/domain/use_case/login_with_email_password_use_case.dart';
import 'package:upadr/features/auth/login/presentation/bloc/login_with_email_password/login_with_email_password_bloc.dart';
import 'package:upadr/features/auth/signup/data/data_source/signup_data_source.dart';
import 'package:upadr/features/auth/signup/data/repository/signup_repository_impl.dart';
import 'package:upadr/features/auth/signup/domain/repository/signup_repository.dart';
import 'package:upadr/features/auth/signup/domain/use_case/signup_with_email_password_use_case.dart';
import 'package:upadr/features/auth/signup/presentation/bloc/signup_with_email_password/signup_with_email_password_bloc.dart';
import 'package:upadr/features/auth/verify_email/data/data_source/resend_otp_data_source.dart';
import 'package:upadr/features/auth/verify_email/data/data_source/verify_email_data_source.dart';
import 'package:upadr/features/auth/verify_email/data/repository/resend_otp_repository_impl.dart';
import 'package:upadr/features/auth/verify_email/data/repository/verify_email_repository_impl.dart';
import 'package:upadr/features/auth/verify_email/domain/repository/resend_otp_repository.dart';
import 'package:upadr/features/auth/verify_email/domain/repository/verify_email_repository.dart';
import 'package:upadr/features/auth/verify_email/domain/use_case/resend_otp_use_case.dart';
import 'package:upadr/features/auth/verify_email/presentation/bloc/resend_otp/resend_otp_bloc.dart';
import 'package:upadr/features/auth/verify_email/presentation/bloc/verify_email/verify_email_bloc.dart';
import 'package:upadr/features/auth/verify_email/domain/use_case/verify_email_use_case.dart';

GetIt getIt = GetIt.instance;

void initDependencies() {
  _signupDependencies();
  _resendOtpDependencies();
  _verifyEmailDependencies();
  _loginDependencies();
  _forgotPasswordDependencies();
  _createNewPasswordDependencies();

  _procedureDependencies();
}

void _signupDependencies() {
  getIt
    ..registerLazySingleton(
      () =>
          SignupWithEmailPasswordBloc(signupWithEmailPasswordUseCase: getIt()),
    )
    ..registerFactory(
      () => SignupWithEmailPasswordUseCase(signupRepositoryImpl: getIt()),
    )
    ..registerFactory<SignupRepository>(
      () => SignupRepositoryImpl(signupDataSourceImpl: getIt()),
    )
    ..registerFactory<SignupDataSource>(
      () => SignupDataSourceImpl(),
    );
}

void _resendOtpDependencies() {
  getIt
    ..registerLazySingleton(
      () => ResendOtpBloc(resendOtpUseCase: getIt()),
    )
    ..registerFactory(
      () => ResendOtpUseCase(resendOtpRepositoryImpl: getIt()),
    )
    ..registerFactory<ResendOtpRepository>(
      () => ResendOtpRepositoryImpl(resendOtpDataSourceImpl: getIt()),
    )
    ..registerFactory<ResendOtpDataSource>(
      () => ResendOtpDataSourceImpl(),
    );
}

void _verifyEmailDependencies() {
  getIt
    ..registerLazySingleton(
      () => VerifyEmailBloc(verifyEmailUseCase: getIt()),
    )
    ..registerFactory(
      () => VerifyEmailUseCase(verifyEmailRepositoryImpl: getIt()),
    )
    ..registerFactory<VerifyEmailRepository>(
      () => VerifyEmailRepositoryImpl(verifyEmailDataSourceImpl: getIt()),
    )
    ..registerFactory<VerifyEmailDataSource>(
      () => VerifyEmailDataSourceImpl(),
    );
}

void _loginDependencies() {
  getIt
    ..registerLazySingleton(
      () => LoginWithEmailPasswordBloc(loginWithEmailPasswordUseCase: getIt()),
    )
    ..registerFactory(
      () => LoginWithEmailPasswordUseCase(loginRepositoryImpl: getIt()),
    )
    ..registerFactory<LoginRepository>(
      () => LoginRepositoryImpl(loginDataSourceImpl: getIt()),
    )
    ..registerFactory<LoginDataSource>(
      () => LoginDataSourceImpl(),
    );
}

void _forgotPasswordDependencies() {
  getIt
    ..registerLazySingleton(
      () => ForgotPasswordBloc(forgotPasswordUseCase: getIt()),
    )
    ..registerFactory(
      () => ForgotPasswordUseCase(forgotPasswordRepositoryImpl: getIt()),
    )
    ..registerFactory<ForgotPasswordRepository>(
      () => ForgotPasswordRepositoryImpl(forgotPasswordDataSourceImpl: getIt()),
    )
    ..registerFactory<ForgotPasswordDataSource>(
      () => ForgotPasswordDataSourceImpl(),
    );
}

void _createNewPasswordDependencies() {
  getIt
    ..registerLazySingleton(
      () => CreateNewPasswordBloc(createNewPasswordUseCase: getIt()),
    )
    ..registerFactory(
      () => CreateNewPasswordUseCase(createNewPasswordRepositoryImpl: getIt()),
    )
    ..registerFactory<CreateNewPasswordRepository>(
      () => CreateNewPasswordRepositoryImpl(
          createNewPasswordDataSourceImpl: getIt()),
    )
    ..registerFactory<CreateNewPasswordDataSource>(
      () => CreateNewPasswordDataSourceImpl(),
    );
}

void _procedureDependencies() {
  getIt
    ..registerLazySingleton(
      () => GetAllProcedureBloc(getAllProcedureUseCase: getIt()),
    )
    ..registerFactory(
      () => GetAllProcedureUseCase(procedureRepositoryImpl: getIt()),
    )
    ..registerFactory<ProcedureRepository>(
      () => ProcedureRepositoryImpl(procedureDataSourceImpl: getIt()),
    )
    ..registerFactory<ProcedureDataSource>(
      () => ProcedureDataSourceImpl(),
    );
}
