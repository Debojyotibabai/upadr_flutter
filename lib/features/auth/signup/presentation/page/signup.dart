import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/auth/login/presentation/pages/login.dart';
import 'package:upadr/features/auth/signup/presentation/bloc/signup_with_email_password/signup_with_email_password_bloc.dart';
import 'package:upadr/features/auth/verify_email/presentation/page/verify_email.dart';
import 'package:upadr/models/signup_with_email_and_password_model.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/utils/constants.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void disposeTextFields() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    disposeTextFields();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email address is required';
    } else if (!Constants.regExp["emailAddress"]!.hasMatch(value)) {
      return 'enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'password is required';
    } else if (!Constants.regExp["password"]!.hasMatch(value)) {
      return 'password must be at least 8 characters with uppercase, lowercase, and a number';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'confirm password is required';
    } else if (value != passwordController.text) {
      return 'passwords must be same';
    }
    return null;
  }

  void signupWithEmailPassword() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<SignupWithEmailPasswordBloc>(context).add(
        SignupWithEmailPassword(
          SignupWithEmailAndPasswordModel(
            confirmPassword: confirmPasswordController.text,
            emailAddress: emailAddressController.text,
            firstName: firstNameController.text,
            lastName: lastNameController.text,
            password: passwordController.text,
          ),
        ),
      );
    }
  }

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
                      child: BlocConsumer<SignupWithEmailPasswordBloc,
                          SignupWithEmailPasswordState>(
                        listener: (context, signupWithEmailPasswordState) {
                          if (signupWithEmailPasswordState
                              is SignupWithEmailPasswordSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(signupWithEmailPasswordState.response),
                              ),
                            );

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => VerifyEmailScreen(
                                  emailAddress: emailAddressController.text,
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  password: passwordController.text,
                                  confirmPassword:
                                      confirmPasswordController.text,
                                ),
                              ),
                            );
                          } else if (signupWithEmailPasswordState
                              is SignupWithEmailPasswordFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(signupWithEmailPasswordState.error),
                              ),
                            );
                          }
                        },
                        builder: (context, signupWithEmailPasswordState) {
                          return Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    PrimaryHeading(text: "Sign up"),
                                    SizedBox(height: 10),
                                    PrimarySubheading(
                                      text:
                                          "Please enter your email and password or sign up with social media",
                                    ),
                                    SizedBox(height: 20),
                                    TextFieldTitle(text: "Full Name"),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: AppPrimaryTextField(
                                            hintText: "first name",
                                            controller: firstNameController,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: AppPrimaryTextField(
                                            hintText: "last name",
                                            controller: lastNameController,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    TextFieldTitle(text: "Email"),
                                    AppPrimaryTextField(
                                      hintText: "example@email.com",
                                      controller: emailAddressController,
                                      validator: _validateEmail,
                                    ),
                                    SizedBox(height: 20),
                                    TextFieldTitle(text: "Password"),
                                    AppPrimaryPasswordField(
                                      hintText: "password",
                                      isPasswordVisible: isPasswordVisible,
                                      onPasswordVisibilityChanged: () {
                                        setState(() {
                                          isPasswordVisible =
                                              !isPasswordVisible;
                                        });
                                      },
                                      controller: passwordController,
                                      validator: _validatePassword,
                                    ),
                                    SizedBox(height: 20),
                                    TextFieldTitle(text: "Confirm Password"),
                                    AppPrimaryPasswordField(
                                      hintText: "confirm password",
                                      isPasswordVisible:
                                          isConfirmPasswordVisible,
                                      onPasswordVisibilityChanged: () {
                                        setState(() {
                                          isConfirmPasswordVisible =
                                              !isConfirmPasswordVisible;
                                        });
                                      },
                                      controller: confirmPasswordController,
                                      validator: _validateConfirmPassword,
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
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      onPressed: () {
                                        signupWithEmailPassword();
                                      },
                                      isLoading: signupWithEmailPasswordState
                                          is SignupWithEmailPasswordLoading,
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already have an account?",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: "Inter",
                                            color: LightColors.gray200,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen(),
                                              ),
                                            );
                                          },
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
                          );
                        },
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
