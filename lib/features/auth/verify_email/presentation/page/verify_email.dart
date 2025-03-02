import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/auth/login/presentation/pages/login.dart';
import 'package:upadr/features/auth/signup/presentation/bloc/signup_with_email_password/signup_with_email_password_bloc.dart';
import 'package:upadr/features/auth/verify_email/presentation/bloc/verify_email/verify_email_bloc.dart';
import 'package:upadr/models/signup_with_email_and_password_model.dart';
import 'package:upadr/models/verify_email_model.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';
import 'package:upadr/widgets/text_field/app_primary_otp_field.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.emailAddress,
    required this.password,
    required this.confirmPassword,
  });

  final String firstName;
  final String lastName;
  final String emailAddress;
  final String password;
  final String confirmPassword;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  String _enteredOtp = "";

  void _handleOtpEntered(String otp) {
    setState(() {
      _enteredOtp = otp;
    });
  }

  void resendOtp() {
    BlocProvider.of<SignupWithEmailPasswordBloc>(context).add(
      SignupWithEmailPassword(
        SignupWithEmailAndPasswordModel(
          confirmPassword: widget.confirmPassword,
          emailAddress: widget.emailAddress,
          firstName: widget.firstName,
          lastName: widget.lastName,
          password: widget.password,
        ),
      ),
    );
  }

  void verifyEmail() {
    if (_enteredOtp.length == 6) {
      BlocProvider.of<VerifyEmailBloc>(context).add(
        VerifyEmail(
          VerifyEmailModel(
            confirmationCode: _enteredOtp,
            emailAddress: widget.emailAddress,
            password: widget.password,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid 6 digit code"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
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
                    PrimaryHeading(text: "Verify Your Email"),
                    SizedBox(height: 10),
                    PrimarySubheading(
                      text:
                          "Please enter the 6 digit code sent to ${widget.emailAddress}",
                    ),
                  ],
                ),
                SizedBox(height: 70),
                AppPrimaryOtpField(
                  onOtpEntered: _handleOtpEntered,
                ),
                SizedBox(height: 40),
                BlocConsumer<SignupWithEmailPasswordBloc,
                    SignupWithEmailPasswordState>(
                  listener: (context, signupWithEmailPasswordState) {
                    if (signupWithEmailPasswordState
                        is SignupWithEmailPasswordSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("OTP sent successfully"),
                        ),
                      );
                    } else if (signupWithEmailPasswordState
                        is SignupWithEmailPasswordFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(signupWithEmailPasswordState.error),
                        ),
                      );
                    }
                  },
                  builder: (context, signupWithEmailPasswordState) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Didn’t receive the code?",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: "Inter",
                            color: LightColors.gray200,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: signupWithEmailPasswordState
                                  is SignupWithEmailPasswordLoading
                              ? null
                              : () {
                                  // resendOtp();
                                },
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
                    );
                  },
                ),
                SizedBox(height: 50),
                BlocConsumer<VerifyEmailBloc, VerifyEmailState>(
                  listener: (context, verifyEmailState) {
                    if (verifyEmailState is VerifyEmailSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(verifyEmailState.response),
                        ),
                      );

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    } else if (verifyEmailState is VerifyEmailFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(verifyEmailState.error),
                        ),
                      );
                    }
                  },
                  builder: (context, verifyEmailState) {
                    return AppPrimaryButton(
                      buttonText: "Verify",
                      width: MediaQuery.of(context).size.width * 0.7,
                      onPressed: verifyEmail,
                      isLoading: verifyEmailState is VerifyEmailLoading,
                    );
                  },
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Change Email?",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Inter",
                      color: LightColors.deepSky,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
