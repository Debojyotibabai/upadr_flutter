import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class PrimarySubheading extends StatelessWidget {
  const PrimarySubheading({
    super.key,
    required this.text,
    this.textColor,
  });

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 17,
        fontFamily: "Inter",
        color: textColor ?? LightColors.gray400,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
