import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.heading,
    required this.subheading,
    required this.confirmButtonText,
    required this.confirmButtonButtonColor,
    this.onConfirm,
  });

  final String heading;
  final String subheading;
  final String confirmButtonText;
  final Color confirmButtonButtonColor;
  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 35,
                    color: LightColors.gray400,
                  ),
                ),
              ],
            ),
            PrimaryHeading(
              text: heading,
              textColor: LightColors.gray400,
            ),
            SizedBox(
              height: 25,
            ),
            PrimarySubheading(
              text: subheading,
            ),
            SizedBox(
              height: 40,
            ),
            AppPrimaryButton(
              buttonText: confirmButtonText,
              width: MediaQuery.of(context).size.width * 0.6,
              backgroundColor: confirmButtonButtonColor,
              onPressed: onConfirm ?? () {},
            ),
            SizedBox(
              height: 10,
            ),
            AppPrimaryButton(
              buttonText: "Cancel",
              width: MediaQuery.of(context).size.width * 0.6,
              textColor: LightColors.deepBlue,
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
