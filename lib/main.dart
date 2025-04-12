import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upadr/features/auth/create_new_password/presentation/bloc/create_new_password/create_new_password_bloc.dart';
import 'package:upadr/features/auth/forgot_password/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:upadr/features/auth/login/presentation/bloc/login_with_email_password/login_with_email_password_bloc.dart';
import 'package:upadr/features/auth/signup/presentation/bloc/signup_with_email_password/signup_with_email_password_bloc.dart';
import 'package:upadr/features/auth/splash/presentation/pages/splash.dart';
import 'package:upadr/features/auth/verify_email/presentation/bloc/resend_otp/resend_otp_bloc.dart';
import 'package:upadr/features/auth/verify_email/presentation/bloc/verify_email/verify_email_bloc.dart';
import 'package:upadr/init_dependencies.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<SignupWithEmailPasswordBloc>()),
        BlocProvider(create: (_) => getIt<ResendOtpBloc>()),
        BlocProvider(create: (_) => getIt<VerifyEmailBloc>()),
        BlocProvider(create: (_) => getIt<LoginWithEmailPasswordBloc>()),
        BlocProvider(create: (_) => getIt<ForgotPasswordBloc>()),
        BlocProvider(create: (_) => getIt<CreateNewPasswordBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Upadr',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
