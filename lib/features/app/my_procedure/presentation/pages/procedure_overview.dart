import 'package:flutter/material.dart';
import 'package:upadr/features/app/faq/presentation/pages/faq_listing.dart';
import 'package:upadr/features/app/my_procedure/presentation/pages/edit_procedure.dart';
import 'package:upadr/features/app/my_procedure/presentation/pages/procedure_particular_step_overview.dart';
import 'package:upadr/features/app/my_procedure/presentation/widgets/procedure_overview_card_left_image.dart';
import 'package:upadr/features/app/my_procedure/presentation/widgets/procedure_overview_card_right_image.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/dialog/confirmation_dialog.dart';
import 'package:upadr/widgets/header/back_header_with_notification.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';

class ProcedureOverviewScreen extends StatefulWidget {
  const ProcedureOverviewScreen({super.key});

  @override
  State<ProcedureOverviewScreen> createState() =>
      _ProcedureOverviewScreenState();
}

class _ProcedureOverviewScreenState extends State<ProcedureOverviewScreen> {
  final menuOptions = ["Edit Procedure", "Cancel Procedure"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackHeaderWithNotification(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: PrimaryHeading(
                                text:
                                    "Great! Here’s an overview on what your colonoscopy prep process will look like.",
                              ),
                            ),
                            PopupMenuButton(
                              icon: Icon(
                                Icons.more_vert,
                                color: LightColors.gray200,
                                size: 27,
                              ),
                              color: LightColors.gray100,
                              itemBuilder: (BuildContext context) {
                                return menuOptions.map(
                                  (menu) {
                                    return PopupMenuItem(
                                      value: menu,
                                      child: Text(
                                        menu,
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "Inter",
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    );
                                  },
                                ).toList();
                              },
                              onSelected: (selectedItem) {
                                if (selectedItem == "Edit Procedure") {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const EditProcedureScreen(),
                                    ),
                                  );
                                } else if (selectedItem == "Cancel Procedure") {
                                  showDialog(
                                    context: context,
                                    builder: (context) => ConfirmationDialog(
                                      heading: "Cancel Procedure",
                                      subheading:
                                          "Are you sure you want to cancel your get_all_procedure? This process is irreversible and you will have to re-enter your information later.",
                                      confirmButtonText: "Cancel Procedure",
                                      confirmButtonButtonColor:
                                          LightColors.deepRed,
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        PrimarySubheading(
                          text:
                              "But don’t worry! We will send you notification when these things need to get done so you don’t have to remember it all.",
                          textColor: Colors.black,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: AppPrimaryButton(
                            buttonText: "Allow Notifications",
                            width: MediaQuery.of(context).size.width * 0.7,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ProcedureOverviewCardRightImage(
                    onSeeMore: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProcedureParticularStepOverviewScreen(),
                        ),
                      );
                    },
                  ),
                  ProcedureOverviewCardLeftImage(
                    onSeeMore: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProcedureParticularStepOverviewScreen(),
                        ),
                      );
                    },
                  ),
                  ProcedureOverviewCardRightImage(
                    onSeeMore: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              const ProcedureParticularStepOverviewScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ).copyWith(
              top: 10,
              bottom: 30,
            ),
            child: AppPrimaryButton(
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
          ),
        ],
      ),
    );
  }
}
