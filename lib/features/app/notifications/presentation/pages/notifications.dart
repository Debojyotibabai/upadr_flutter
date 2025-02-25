import 'package:flutter/material.dart';
import 'package:upadr/features/app/notifications/presentation/widgets/notification_card.dart';
import 'package:upadr/widgets/header/back_header_without_notification.dart';
import 'package:upadr/widgets/text/primary_heading.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackHeaderWithoutNotification(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: PrimaryHeading(text: "Notifications"),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return NotificationCard();
                }),
          )
        ],
      ),
    );
  }
}
