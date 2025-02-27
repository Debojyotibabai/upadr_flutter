import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class FaqCard extends StatelessWidget {
  const FaqCard({
    super.key,
    required this.text,
    required this.onPress,
  });

  final String text;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(
          horizontal: 25,
        ).copyWith(bottom: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: LightColors.gray100,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontFamily: "Inter",
            color: LightColors.deepBlue,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
