import 'package:flutter/material.dart';
import 'package:upadr/features/app/faq/presentation/pages/faq_listing.dart';
import 'package:upadr/features/app/my_procedure/presentation/pages/my_procedure_listing.dart';
import 'package:upadr/features/app/notifications/presentation/pages/notifications.dart';
import 'package:upadr/features/app/settings/presentation/pages/settings.dart';
import 'package:upadr/features/app/survey/presentation/pages/survey_listing.dart';
import 'package:upadr/styles/light_colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<Map<String, Object>> drawerOptions = [
    {"icon": Icons.medical_services, "title": "My Procedures"},
    {"icon": Icons.tips_and_updates, "title": "Tips"},
    {"icon": Icons.file_copy, "title": "Surveys"},
    {"icon": Icons.settings, "title": "Settings"},
    {"icon": Icons.notifications, "title": "Notifications"},
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: LightColors.deepGraySky,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
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
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: drawerOptions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      switch (index) {
                        case 0:
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return const MyProcedureListingScreen();
                              },
                            ),
                          );
                        case 1:
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return const FaqListingScreen();
                              },
                            ),
                          );
                        case 2:
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return const SurveyListingScreen();
                              },
                            ),
                          );
                        case 3:
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return const SettingsScreen();
                              },
                            ),
                          );
                        case 4:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const NotificationsScreen();
                              },
                            ),
                          );
                        default:
                          null;
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            drawerOptions[index]["icon"] as IconData,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            drawerOptions[index]["title"] as String,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.05,
                  ),
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
