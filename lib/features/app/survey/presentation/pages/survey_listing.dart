import 'package:flutter/material.dart';
import 'package:upadr/widgets/custom_drawer.dart';
import 'package:upadr/widgets/header/drawer_header_with_logo.dart';
import 'package:upadr/widgets/text/primary_heading.dart';

class SurveyListingScreen extends StatefulWidget {
  const SurveyListingScreen({super.key});

  @override
  State<SurveyListingScreen> createState() => SurveyListingScreenState();
}

class SurveyListingScreenState extends State<SurveyListingScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

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
            child: PrimaryHeading(text: "Surveys"),
          ),
        ],
      ),
    );
  }
}
