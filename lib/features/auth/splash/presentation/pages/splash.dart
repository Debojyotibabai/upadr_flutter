import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/app/my_procedure/presentation/pages/my_procedure_listing.dart';
import 'package:upadr/features/auth/welcome/presentation/pages/welcome.dart';
import 'package:upadr/styles/light_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkLoginStatusAndRedirect() {
    Future.delayed(
      const Duration(seconds: 2),
      () async {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        final String? token = prefs.getString('token');

        if (token != null) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const MyProcedureListingScreen(),
            ),
            (route) => false,
          );
        } else {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
            ),
            (route) => false,
          );
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatusAndRedirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: LightColors.lightSky,
        child: Center(
          child: Image.asset(
            Images.logoWithAppName,
            scale: 2,
          ),
        ),
      ),
    );
  }
}
