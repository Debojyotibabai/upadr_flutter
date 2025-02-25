import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/styles/light_colors.dart';

class BackHeaderWithNotification extends StatelessWidget
    implements PreferredSizeWidget {
  const BackHeaderWithNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LightColors.lightSky,
      title: Image.asset(Images.logoWithAppName, scale: 4),
      leading: Icon(
        Icons.arrow_back_ios,
        color: LightColors.deepBlue,
        size: 28,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.notifications,
            color: LightColors.deepBlue,
            size: 35,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
