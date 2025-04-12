import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/auth/create_new_password/presentation/pages/create_new_password.dart';
import 'package:upadr/features/auth/forgot_password/presentation/bloc/forgot_password/forgot_password_bloc.dart';
import 'package:upadr/models/forgot_password_model.dart';
import 'package:upadr/utils/constants.dart';
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
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'email address is required';
    } else if (!Constants.regExp["emailAddress"]!.hasMatch(value)) {
      return 'enter a valid email address';
    }
    return null;
  }

  void _forgotPassword() {
    if (_formKey.currentState!.validate()) {
      final forgotPasswordModel =
          ForgotPasswordModel(emailAddress: _emailController.text);

      BlocProvider.of<ForgotPasswordBloc>(context)
          .add(ForgotPassword(forgotPasswordModel: forgotPasswordModel));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Form(
            key: _formKey,
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
                  controller: _emailController,
                  validator: _validateEmail,
                ),
                Spacer(),
                BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                  listener: (context, forgotPasswordState) {
                    if (forgotPasswordState is ForgotPasswordError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(forgotPasswordState.error),
                        ),
                      );
                    } else if (forgotPasswordState is ForgotPasswordSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(forgotPasswordState.response),
                        ),
                      );

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateNewPasswordScreen(),
                        ),
                      );
                    }
                  },
                  builder: (context, forgotPasswordState) {
                    return AppPrimaryButton(
                      buttonText: "Send Code",
                      width: MediaQuery.of(context).size.width * 0.7,
                      onPressed: () {
                        _forgotPassword();
                      },
                      isLoading: forgotPasswordState is ForgotPasswordLoading,
                    );
                  },
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
