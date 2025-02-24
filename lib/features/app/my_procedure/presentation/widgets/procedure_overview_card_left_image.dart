import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class ProcedureOverviewCardLeftImage extends StatelessWidget {
  const ProcedureOverviewCardLeftImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Transform.translate(
            offset: Offset(-30, 0),
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 90,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Step 1",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Inter",
                      color: Colors.black,
                      height: 1.3,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "3 days before procedure",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Inter",
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Inter",
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Show More Details",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Inter",
                      color: LightColors.deepSky,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
