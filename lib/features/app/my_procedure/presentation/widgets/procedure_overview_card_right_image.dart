import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';

class ProcedureOverviewCardRightImage extends StatelessWidget {
  const ProcedureOverviewCardRightImage({
    super.key,
    required this.onSeeMore,
  });

  final void Function() onSeeMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Step 1",
                    textAlign: TextAlign.left,
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
                    "3 days before get_all_procedure",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Inter",
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Inter",
                      color: LightColors.gray400,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      onSeeMore();
                    },
                    child: Text(
                      "Show More Details",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Inter",
                        color: LightColors.deepSky,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.translate(
            offset: Offset(30, 0),
            child: CircleAvatar(
              backgroundColor: Colors.black12,
              radius: 85,
            ),
          ),
        ],
      ),
    );
  }
}
