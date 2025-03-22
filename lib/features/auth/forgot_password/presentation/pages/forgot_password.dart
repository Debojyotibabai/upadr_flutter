import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/auth/create_new_password/presentation/pages/create_new_password.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';
import 'package:upadr/widgets/text_field/app_primary_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 100),
              Center(
                child: Image.asset(
                  Images.logoWithAppName,
                  scale: 2,
                ),
              ),
              SizedBox(height: 100),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryHeading(text: "Forgot Your Password?"),
                  SizedBox(height: 10),
                  PrimarySubheading(
                    text:
                        "Please enter the email or phone number you signed up with to reset your password",
                  ),
                ],
              ),
              SizedBox(height: 70),
              AppPrimaryTextField(
                hintText: "example@email.com",
              ),
              Spacer(),
              AppPrimaryButton(
                buttonText: "Send Code",
                width: MediaQuery.of(context).size.width * 0.7,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CreateNewPasswordScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
