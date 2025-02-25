import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AppPrimaryTimePickerField extends StatefulWidget {
  const AppPrimaryTimePickerField({super.key});

  @override
  State<AppPrimaryTimePickerField> createState() =>
      _AppPrimaryTimePickerFieldState();
}

class _AppPrimaryTimePickerFieldState extends State<AppPrimaryTimePickerField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        picker.DatePicker.showTime12hPicker(
          context,
          onConfirm: (time) {},
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: LightColors.gray200,
            width: 1,
          ),
        ),
        child: Text(
          "hh:mm",
          style: TextStyle(
            color: LightColors.gray200,
            fontFamily: "Inter",
            fontWeight: FontWeight.w400,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
