import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/styles/light_colors.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 25).copyWith(bottom: 15),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            Images.logoWithoutAppName,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Upadr",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w500,
                    color: LightColors.gray300,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "It’s 1 day until your get_all_procedure! It’s time to lorem ipsum dolor sit amet dolor...",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontWeight: FontWeight.w400,
                    color: LightColors.gray200,
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
