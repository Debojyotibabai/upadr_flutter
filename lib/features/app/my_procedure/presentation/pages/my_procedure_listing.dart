import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/custom_drawer.dart';
import 'package:upadr/widgets/header/drawer_header_with_logo.dart';
import 'package:upadr/widgets/my_procedure_card.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';

class MyProcedureListingScreen extends StatefulWidget {
  const MyProcedureListingScreen({super.key});

  @override
  State<MyProcedureListingScreen> createState() =>
      _MyProcedureListingScreenState();
}

class _MyProcedureListingScreenState extends State<MyProcedureListingScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<int> selectedProcedures = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: DrawerHeaderWithLogo(
        openDrawer: () {
          _key.currentState!.openDrawer();
        },
      ),
      drawer: CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: PrimaryHeading(text: "My Procedures"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimarySubheading(
                  text: "Upcoming",
                  textColor: LightColors.gray200,
                ),
                Divider(),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return MyProcedureCard();
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimarySubheading(
                  text: "Completed",
                  textColor: LightColors.gray200,
                ),
                Divider(),
              ],
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return MyProcedureCard();
              },
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 25).copyWith(bottom: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppPrimaryButton(
                    buttonText: "FAQ's and Tips",
                    width: MediaQuery.of(context).size.width * 0.7,
                  ),
                  SizedBox(height: 10),
                  AppPrimaryButton(
                    buttonText: "Prep For Another Procedure",
                    width: MediaQuery.of(context).size.width * 0.7,
                    textColor: LightColors.deepSky,
                    backgroundColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
