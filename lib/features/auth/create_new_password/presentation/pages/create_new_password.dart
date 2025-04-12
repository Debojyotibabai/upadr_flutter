import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/auth/create_new_password/presentation/bloc/create_new_password/create_new_password_bloc.dart';
import 'package:upadr/features/auth/login/presentation/pages/login.dart';
import 'package:upadr/features/auth/verify_email/presentation/bloc/resend_otp/resend_otp_bloc.dart';
import 'package:upadr/models/create_new_password_model.dart';
import 'package:upadr/models/resend_otp_model.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/utils/constants.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';
import 'package:upadr/widgets/text/text_field_title.dart';
import 'package:upadr/widgets/text_field/app_primary_otp_field.dart';
import 'package:upadr/widgets/text_field/app_primary_password_field.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  final String emailAddress;

  const CreateNewPasswordScreen({super.key, required this.emailAddress});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String _enteredOtp = "";

  void _handleOtpEntered(String otp) {
    setState(() {
      _enteredOtp = otp;
    });
  }

  void _resendOtp() {
    BlocProvider.of<ResendOtpBloc>(context).add(ResendOtp(
        resendOtpModel: ResendOtpModel(emailAddress: widget.emailAddress)));
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'new password is required';
    } else if (!Constants.regExp["password"]!.hasMatch(value)) {
      return 'password must be at least 8 characters with uppercase, lowercase, and a number';
    }
    return null;
  }

  String? _validateConfimPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'confirm password is required';
    } else if (value != _passwordController.text) {
      return 'passwords must match';
    }

    return null;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _createNewPassword() {
    if (_enteredOtp == "" || _enteredOtp.length != 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a valid OTP"),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      final CreateNewPasswordModel createNewPasswordModel =
          CreateNewPasswordModel(
        confirmPassword: _confirmPasswordController.text,
        emailAddress: widget.emailAddress,
        newPassword: _passwordController.text,
        resetCode: _enteredOtp,
      );

      BlocProvider.of<CreateNewPasswordBloc>(context).add(
          CreateNewPassword(createNewPasswordModel: createNewPasswordModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Please enter the 6 digit code sent to ${widget.emailAddress}",
                  ),
                  SizedBox(height: 70),
                  Center(
                    child: AppPrimaryOtpField(
                      onOtpEntered: _handleOtpEntered,
                    ),
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
                          color: LightColors.gray200,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      BlocConsumer<ResendOtpBloc, ResendOtpState>(
                        listener: (context, resendOtpState) {
                          if (resendOtpState is ResendOtpFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(resendOtpState.error),
                              ),
                            );
                          } else if (resendOtpState is ResendOtpSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(resendOtpState.response),
                              ),
                            );
                          }
                        },
                        builder: (context, resendOtpState) {
                          return TextButton(
                            onPressed: resendOtpState is ResendOtpLoading
                                ? null
                                : _resendOtp,
                            child: Text(
                              "Resend",
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: "Inter",
                                color: LightColors.deepSky,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        },
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
                    controller: _passwordController,
                    validator: _validatePassword,
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
                    controller: _confirmPasswordController,
                    validator: _validateConfimPassword,
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: BlocConsumer<CreateNewPasswordBloc,
                        CreateNewPasswordState>(
                      listener: (context, createNewPasswordState) {
                        if (createNewPasswordState is CreateNewPasswordError) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(createNewPasswordState.error),
                            ),
                          );
                        } else if (createNewPasswordState
                            is CreateNewPasswordSuccess) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(createNewPasswordState.response),
                            ),
                          );

                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }
                      },
                      builder: (context, createNewPasswordState) {
                        return AppPrimaryButton(
                          buttonText: "Confirm",
                          width: MediaQuery.of(context).size.width * 0.7,
                          onPressed: () {
                            _createNewPassword();
                          },
                          isLoading: createNewPasswordState
                              is CreateNewPasswordLoading,
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
