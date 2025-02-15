import 'package:flutter/material.dart';

class PrimaryHeading extends StatelessWidget {
  const PrimaryHeading({
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
        fontSize: 25,
        fontWeight: FontWeight.w600,
        fontFamily: "Inter",
        color: textColor ?? Colors.black,
      ),
    );
  }
}
