import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class TextFieldTitle extends StatelessWidget {
  const TextFieldTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontFamily: "Inter",
              color: LightColors.gray300,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
