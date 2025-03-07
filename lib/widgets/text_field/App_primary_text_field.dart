import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class AppPrimaryTextField extends StatelessWidget {
  AppPrimaryTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
  });

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

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
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
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
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
      validator: validator ??
          (value) =>
              value!.isEmpty ? '${hintText.toLowerCase()} is required' : null,
    );
  }
}
