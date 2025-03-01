import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.buttonText,
    this.width,
    this.backgroundColor,
    this.textColor = Colors.white,
    this.onPressed,
    this.isLoading = false,
  });

  final String buttonText;
  final double? width;
  final Color? backgroundColor;
  final Color? textColor;
  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed ?? () {},
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(0),
          padding: WidgetStateProperty.all<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            backgroundColor ?? LightColors.deepBlue,
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(
                width: 2.5,
                color: textColor != Colors.white
                    ? textColor!
                    : backgroundColor ?? LightColors.deepBlue,
              ),
            ),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: textColor,
              )
            : Text(
                buttonText,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
      ),
    );
  }
}
