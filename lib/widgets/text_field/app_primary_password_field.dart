import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class AppPrimaryPasswordField extends StatelessWidget {
  AppPrimaryPasswordField({
    super.key,
    required this.hintText,
    required this.isPasswordVisible,
    required this.onPasswordVisibilityChanged,
  });

  final String hintText;
  final bool isPasswordVisible;
  final void Function() onPasswordVisibilityChanged;

  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: LightColors.gray200,
      width: 1,
    ),
  );

  final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
  );

  final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.red[300]!,
      width: 1,
    ),
  );

  final OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.red,
      width: 1,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        suffixIcon: isPasswordVisible
            ? IconButton(
                onPressed: onPasswordVisibilityChanged,
                icon: Icon(Icons.visibility_off))
            : IconButton(
                onPressed: onPasswordVisibilityChanged,
                icon: Icon(Icons.visibility)),
        border: border,
        enabledBorder: border,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        hintText: hintText,
        hintStyle: TextStyle(
          color: LightColors.gray200,
          fontFamily: "Inter",
          fontWeight: FontWeight.w400,
          fontSize: 17,
        ),
      ),
      obscureText: isPasswordVisible,
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
    );
  }
}
