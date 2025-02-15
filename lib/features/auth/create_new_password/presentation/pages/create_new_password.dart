import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';
import 'package:upadr/widgets/text/text_field_title.dart';
import 'package:upadr/widgets/text_field/app_primary_otp_field.dart';
import 'package:upadr/widgets/text_field/app_primary_password_field.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 30,
                ),
                SizedBox(height: 100),
                Center(
                  child: Image.asset(
                    Images.logoWithAppName,
                    scale: 2,
                  ),
                ),
                SizedBox(height: 100),
                PrimaryHeading(text: "Create New Password"),
                SizedBox(height: 10),
                PrimarySubheading(
                  text:
                      "Please enter the 6 digit code sent to email@example.com",
                ),
                SizedBox(height: 70),
                Center(
                  child: AppPrimaryOtpField(),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Didn’t receive the code?",
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
                        "Resend",
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
                SizedBox(height: 40),
                PrimarySubheading(
                  text:
                      "Your new password must be different from your previously used password",
                ),
                SizedBox(height: 20),
                TextFieldTitle(text: "New Password"),
                AppPrimaryPasswordField(
                  hintText: "new password",
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
                      isConfirmPasswordVisible = !isConfirmPasswordVisible;
                    });
                  },
                ),
                SizedBox(height: 40),
                Center(
                  child: AppPrimaryButton(
                    buttonText: "Confirm",
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
