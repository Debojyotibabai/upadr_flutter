import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';

class ExpandableFaqCard extends StatelessWidget {
  const ExpandableFaqCard({
    super.key,
    required this.question,
    required this.answer,
    required this.isOpened,
    required this.onPress,
  });

  final String question;
  final String answer;
  final bool isOpened;
  final void Function() onPress;

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
      child: Column(
        children: [
          GestureDetector(
            onTap: onPress,
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "Inter",
                      color: LightColors.gray400,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(
                  isOpened ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: LightColors.gray200,
                  size: 30,
                ),
              ],
            ),
          ),
          isOpened
              ? Column(
                  children: [
                    Divider(),
                    PrimarySubheading(text: answer),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
