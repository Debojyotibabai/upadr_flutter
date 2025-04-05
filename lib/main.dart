import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        BlocProvider(create: (context) => getIt<SignupWithEmailPasswordBloc>()),
        BlocProvider(create: (context) => getIt<ResendOtpBloc>()),
        BlocProvider(create: (context) => getIt<VerifyEmailBloc>()),
        BlocProvider(create: (context) => getIt<LoginWithEmailPasswordBloc>()),
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
