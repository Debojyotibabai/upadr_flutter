import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/app/choose_procedure/presentation/pages/choose_date_time.dart';
import 'package:upadr/features/app/my_procedure/presentation/pages/my_procedure_listing.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/custom_drawer.dart';
import 'package:upadr/widgets/header/drawer_header_without_logo.dart';
import 'package:upadr/widgets/my_procedure_card.dart';
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
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ).copyWith(top: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PrimaryHeading(text: "Welcome to upadr!"),
                              SizedBox(height: 15),
                              PrimarySubheading(
                                text:
                                    "We’re here to get you ready for your get_all_procedure and make sure you have everything you need.",
                                textColor: LightColors.gray200,
                              ),
                              SizedBox(height: 20),
                              PrimarySubheading(
                                text:
                                    "Let’s start with determining what get_all_procedure you need to get prepared for...",
                                textColor: Colors.black,
                              ),
                              SizedBox(height: 20),
                              GridView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 2,
                                ),
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selectedProcedures
                                            .contains(index)) {
                                          selectedProcedures.remove(index);
                                        } else {
                                          selectedProcedures.add(index);
                                        }
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color:
                                            selectedProcedures.contains(index)
                                                ? LightColors.deepBlue
                                                : Colors.white,
                                        border: Border.all(
                                          color: LightColors.deepBlue,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Procedure #${index + 1}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: "Inter",
                                            color: selectedProcedures
                                                    .contains(index)
                                                ? Colors.white
                                                : LightColors.deepBlue,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        MyProcedureCard(
                          title: "Procedure",
                          onPress: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const MyProcedureListingScreen(),
                              ),
                              (route) => false,
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ).copyWith(bottom: 30),
                          child: Row(
                            children: [
                              Spacer(),
                              Expanded(
                                child: AppPrimaryButton(
                                  buttonText: "Next",
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ChooseDateTimeScreen(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
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
