import 'package:flutter/material.dart';
import 'package:upadr/features/app/notifications/presentation/pages/notifications.dart';
import 'package:upadr/styles/light_colors.dart';

class DrawerHeaderWithoutLogo extends StatelessWidget
    implements PreferredSizeWidget {
  const DrawerHeaderWithoutLogo({
    super.key,
    required this.openDrawer,
  });

  final void Function()? openDrawer;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: LightColors.lightSky,
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
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const NotificationsScreen(),
              ),
            );
          },
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
