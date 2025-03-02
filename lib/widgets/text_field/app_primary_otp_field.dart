import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:upadr/styles/light_colors.dart';

class AppPrimaryOtpField extends StatelessWidget {
  const AppPrimaryOtpField({
    super.key,
    required this.onOtpEntered,
  });

  final void Function(String otp) onOtpEntered;

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      showFieldAsBox: true,
      fieldWidth: 45,
      borderWidth: 1,
      borderColor: LightColors.gray200,
      enabledBorderColor: LightColors.gray200,
      focusedBorderColor: Colors.black,
      mainAxisAlignment: MainAxisAlignment.center,
      autoFocus: true,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(
        color: Colors.black,
        fontFamily: "Inter",
        fontWeight: FontWeight.w400,
        fontSize: 17,
      ),
      onSubmit: (String otp) {
        onOtpEntered(otp);
      },
    );
  }
}
