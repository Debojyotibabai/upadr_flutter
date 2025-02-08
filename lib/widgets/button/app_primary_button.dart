import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.buttonText,
    this.width,
    this.backgroundColor,
    this.textColor,
    this.onPressed,
  });

  final String buttonText;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(0),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
              backgroundColor ?? LightColors.deepBlue),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
