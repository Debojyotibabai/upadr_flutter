import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/styles/light_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
