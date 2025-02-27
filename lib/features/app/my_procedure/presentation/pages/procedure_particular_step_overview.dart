import 'package:flutter/material.dart';
import 'package:upadr/features/app/choose_procedure/presentation/pages/choose_procedure.dart';
import 'package:upadr/features/app/faq/presentation/pages/faq_listing.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/header/back_header_with_notification.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';

class ProcedureParticularStepOverviewScreen extends StatefulWidget {
  const ProcedureParticularStepOverviewScreen({super.key});

  @override
  State<ProcedureParticularStepOverviewScreen> createState() =>
      _ProcedureParticularStepOverviewScreenState();
}

class _ProcedureParticularStepOverviewScreenState
    extends State<ProcedureParticularStepOverviewScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: BackHeaderWithNotification(),
      body: Padding(
        padding: const EdgeInsets.all(25).copyWith(top: 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25),
                    PrimaryHeading(text: "Step 2"),
                    SizedBox(height: 5),
                    Text(
                      "3 days before procedure",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Inter",
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 230,
                      color: Colors.black12,
                    ),
                    SizedBox(height: 25),
                    PrimarySubheading(
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppPrimaryButton(
                      buttonText: "FAQ's and Tips",
                      width: MediaQuery.of(context).size.width * 0.7,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const FaqListingScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    AppPrimaryButton(
                      buttonText: "Prep For Another Procedure",
                      width: MediaQuery.of(context).size.width * 0.7,
                      textColor: LightColors.deepSky,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const ChooseProcedureScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
