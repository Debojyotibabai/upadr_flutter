import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/text/text_field_title.dart';
import 'package:upadr/widgets/text_field/App_primary_text_field.dart';
import 'package:upadr/widgets/text_field/app_primary_password_field.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.lightSky,
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100),
              Image.asset(
                Images.logoWithAppName,
                scale: 2,
              ),
              SizedBox(height: 100),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 25,
                      ),
                      child: Column(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                "Sign up",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Inter",
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Please enter your email and password or sign up with social media",
                                style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: "Inter",
                                  color: LightColors.gray300,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFieldTitle(text: "Full Name"),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppPrimaryTextField(
                                      hintText: "first name",
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: AppPrimaryTextField(
                                      hintText: "last name",
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              TextFieldTitle(text: "Email"),
                              AppPrimaryTextField(
                                hintText: "example@email.com",
                              ),
                              SizedBox(height: 20),
                              TextFieldTitle(text: "Password"),
                              AppPrimaryPasswordField(
                                hintText: "password",
                                isPasswordVisible: isPasswordVisible,
                                onPasswordVisibilityChanged: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              TextFieldTitle(text: "Confirm Password"),
                              AppPrimaryPasswordField(
                                hintText: "confirm password",
                                isPasswordVisible: isConfirmPasswordVisible,
                                onPasswordVisibilityChanged: () {
                                  setState(() {
                                    isConfirmPasswordVisible =
                                        !isConfirmPasswordVisible;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 40),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppPrimaryButton(
                                buttonText: "Sign up",
                                width: MediaQuery.of(context).size.width * 0.7,
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "Inter",
                                      color: LightColors.gray100,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Log in",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: "Inter",
                                        color: LightColors.deepSky,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
