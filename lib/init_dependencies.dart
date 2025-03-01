import 'package:get_it/get_it.dart';
import 'package:upadr/features/auth/signup/data/data_source/signup_data_source.dart';
import 'package:upadr/features/auth/signup/data/repository/signup_repository_impl.dart';
import 'package:upadr/features/auth/signup/domain/repository/signup_repository.dart';
import 'package:upadr/features/auth/signup/domain/use_case/signup_with_email_password_use_case.dart';
import 'package:upadr/features/auth/signup/presentation/bloc/signup_with_email_password/signup_with_email_password_bloc.dart';

GetIt getIt = GetIt.instance;

void initDependencies() {
  _signupDependencies();
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
