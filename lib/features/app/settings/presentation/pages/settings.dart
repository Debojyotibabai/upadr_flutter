import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/dialog/confirmation_dialog.dart';
import 'package:upadr/widgets/header/drawer_header_with_logo.dart';
import 'package:upadr/widgets/text/primary_heading.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<String> settingsOption = [
    "Terms and Conditions",
    "Privacy Policy",
    "Contact Us",
    "Rate App",
    "Accessibility",
    "Schedule New Procedure",
    "Change Password"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DrawerHeaderWithLogo(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryHeading(text: "Settings"),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(20),
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
              child: Text(
                "Debojyoti Ghosh",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: LightColors.gray400,
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: settingsOption.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        child: Row(
                          children: [
                            Text(
                              settingsOption[index],
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: LightColors.gray400,
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: LightColors.gray300,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                      Divider(),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: AppPrimaryButton(
                  buttonText: "Delete Account",
                  backgroundColor: LightColors.deepRed,
                  width: MediaQuery.of(context).size.width * 0.7,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ConfirmationDialog(
                          heading: "Delete Account",
                          subheading:
                              "Are you sure you want to delete your account? This process is irreversible and all your data will be lost.",
                          confirmButtonText: "Delete Account",
                          confirmButtonButtonColor: LightColors.deepRed,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
