import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/styles/light_colors.dart';

class DrawerHeaderWithLogo extends StatelessWidget
    implements PreferredSizeWidget {
  const DrawerHeaderWithLogo({
    super.key,
    required this.openDrawer,
  });

  final void Function()? openDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LightColors.lightSky,
      title: Image.asset(Images.logoWithAppName, scale: 4),
      leading: GestureDetector(
        onTap: openDrawer,
        child: Icon(
          Icons.menu,
          color: LightColors.deepBlue,
          size: 37,
        ),
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
