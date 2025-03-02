import 'package:get_it/get_it.dart';
import 'package:upadr/features/auth/signup/data/data_source/signup_data_source.dart';
import 'package:upadr/features/auth/signup/data/repository/signup_repository_impl.dart';
import 'package:upadr/features/auth/signup/domain/repository/signup_repository.dart';
import 'package:upadr/features/auth/signup/domain/use_case/signup_with_email_password_use_case.dart';
import 'package:upadr/features/auth/signup/presentation/bloc/signup_with_email_password/signup_with_email_password_bloc.dart';
import 'package:upadr/features/auth/verify_email/data/data_source/verify_email_data_source.dart';
import 'package:upadr/features/auth/verify_email/data/repository/verify_email_repository_impl.dart';
import 'package:upadr/features/auth/verify_email/domain/repository/verify_email_repository.dart';
import 'package:upadr/features/auth/verify_email/presentation/bloc/verify_email/verify_email_bloc.dart';
import 'package:upadr/features/auth/verify_email/presentation/use_case/verify_email_use_case.dart';

GetIt getIt = GetIt.instance;

void initDependencies() {
  _signupDependencies();
  _verifyEmailDependencies();
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
