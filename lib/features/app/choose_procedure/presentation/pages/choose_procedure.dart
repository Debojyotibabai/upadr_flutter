import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/custom_drawer.dart';
import 'package:upadr/widgets/header/drawer_header_without_logo.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';

class ChooseProcedureScreen extends StatefulWidget {
  const ChooseProcedureScreen({super.key});

  @override
  State<ChooseProcedureScreen> createState() => _ChooseProcedureScreenState();
}

class _ChooseProcedureScreenState extends State<ChooseProcedureScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<int> selectedProcedures = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: LightColors.lightSky,
      appBar: DrawerHeaderWithoutLogo(
        openDrawer: () {
          _key.currentState!.openDrawer();
        },
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Image.asset(
              Images.logoWithAppName,
              scale: 2,
            ),
            SizedBox(height: 100),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 25,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: PrimaryHeading(text: "Welcome!"),
                      ),
                      SizedBox(height: 15),
                      PrimarySubheading(
                        text:
                            "We’re here to get you ready for your procedure and make sure you have everything you need.",
                        textColor: LightColors.gray200,
                      ),
                      SizedBox(height: 20),
                      PrimarySubheading(
                        text:
                            "Let’s start with determining what procedure you need to get prepared for...",
                        textColor: Colors.black,
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (selectedProcedures.contains(index)) {
                                    selectedProcedures.remove(index);
                                  } else {
                                    selectedProcedures.add(index);
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: selectedProcedures.contains(index)
                                      ? LightColors.deepBlue
                                      : Colors.white,
                                  border: Border.all(
                                    color: LightColors.deepBlue,
                                    width: 2,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: Text(
                                  "Procedure #${index + 1}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontFamily: "Inter",
                                    color: selectedProcedures.contains(index)
                                        ? Colors.white
                                        : LightColors.deepBlue,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Spacer(),
                          Expanded(child: AppPrimaryButton(buttonText: "Next")),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
