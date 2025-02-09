import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class AppPrimaryTextField extends StatelessWidget {
  AppPrimaryTextField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  final OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: LightColors.gray100,
      width: 1.5,
    ),
  );

  final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1.5,
    ),
  );

  final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.red[300]!,
      width: 1.5,
    ),
  );

  final OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Colors.red,
      width: 1.5,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: border,
        enabledBorder: border,
        focusedBorder: focusedBorder,
        errorBorder: errorBorder,
        focusedErrorBorder: focusedErrorBorder,
        hintText: hintText,
        hintStyle: TextStyle(
          color: LightColors.gray100,
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
    );
  }
}
