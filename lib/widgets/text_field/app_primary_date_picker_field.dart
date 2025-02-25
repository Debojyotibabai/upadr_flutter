import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;

class AppPrimaryDatePickerField extends StatefulWidget {
  const AppPrimaryDatePickerField({super.key});

  @override
  State<AppPrimaryDatePickerField> createState() =>
      _AppPrimaryDatePickerFieldState();
}

class _AppPrimaryDatePickerFieldState extends State<AppPrimaryDatePickerField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        picker.DatePicker.showDatePicker(
          context,
          minTime: DateTime.now(),
          onConfirm: (date) {},
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "mm/dd/yyyy",
                style: TextStyle(
                  color: LightColors.gray200,
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
            ),
            Icon(
              Icons.calendar_today_outlined,
              color: LightColors.deepSky,
            ),
          ],
        ),
      ),
    );
  }
}
