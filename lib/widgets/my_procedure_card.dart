import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class MyProcedureCard extends StatelessWidget {
  const MyProcedureCard({
    super.key,
    required this.onPress,
  });

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
        child: Row(
          children: [
            Expanded(
              child: Text(
                "My Procedure",
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: "Inter",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: LightColors.gray200,
            ),
          ],
        ),
      ),
    );
  }
}
