import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: LightColors.lightSky,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image.asset(
                Images.logoWithAppName,
                scale: 2,
              ),
              SizedBox(height: 100),
              AppPrimaryButton(
                buttonText: "Sign Up",
                width: MediaQuery.of(context).size.width * 0.75,
              ),
              SizedBox(height: 15),
              AppPrimaryButton(
                buttonText: "Login",
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
