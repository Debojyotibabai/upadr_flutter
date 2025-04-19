import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/app/my_procedure/presentation/pages/my_procedure_listing.dart';
import 'package:upadr/features/auth/forgot_password/presentation/pages/forgot_password.dart';
import 'package:upadr/features/auth/login/presentation/bloc/login_with_email_password/login_with_email_password_bloc.dart';
import 'package:upadr/features/auth/signup/presentation/page/signup.dart';
import 'package:upadr/models/login_with_email_and_password_model.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/utils/constants.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';
import 'package:upadr/widgets/text/text_field_title.dart';
import 'package:upadr/widgets/text_field/app_primary_text_field.dart';
import 'package:upadr/widgets/text_field/app_primary_password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

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

  @override
  void dispose() {
    super.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
  }

  void loginWithEmailPassword() {
    BlocProvider.of<LoginWithEmailPasswordBloc>(context).add(
      LoginWithEmailPassword(
        LoginWithEmailAndPasswordModel(
          emailAddress: emailAddressController.text,
          password: passwordController.text,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.lightSky,
      body:
          BlocConsumer<LoginWithEmailPasswordBloc, LoginWithEmailPasswordState>(
        listener: (context, loginWithEmailPasswordState) {
          if (loginWithEmailPasswordState is LoginWithEmailPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(loginWithEmailPasswordState.error),
              ),
            );
          } else if (loginWithEmailPasswordState
              is LoginWithEmailPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(loginWithEmailPasswordState.response.message!),
              ),
            );

            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const MyProcedureListingScreen(),
              ),
              (route) => false,
            );
          }
        },
        builder: (context, loginWithEmailPasswordState) {
          return SafeArea(
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
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    PrimaryHeading(text: "Login"),
                                    SizedBox(height: 10),
                                    PrimarySubheading(
                                      text:
                                          "Please enter your email and password or log in with social media",
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
                                  ],
                                ),
                                Row(
                                  children: [
                                    Spacer(),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const ForgotPasswordScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Forgot Password?",
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
                                SizedBox(height: 35),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppPrimaryButton(
                                      buttonText: "Log in",
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      onPressed: () {
                                        loginWithEmailPassword();
                                      },
                                      isLoading: loginWithEmailPasswordState
                                          is LoginWithEmailPasswordLoading,
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have an account?",
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
                                                    const SignupScreen(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Sign up",
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
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
