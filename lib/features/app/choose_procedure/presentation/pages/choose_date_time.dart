import 'package:flutter/material.dart';
import 'package:upadr/assets/images.dart';
import 'package:upadr/features/app/my_procedure/presentation/pages/procedure_overview.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/header/back_header_without_logo.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';
import 'package:upadr/widgets/text/text_field_title.dart';
import 'package:upadr/widgets/text_field/app_primary_date_picker_field.dart';
import 'package:upadr/widgets/text_field/app_primary_time_picker_field.dart';

class ChooseDateTimeScreen extends StatefulWidget {
  const ChooseDateTimeScreen({super.key});

  @override
  State<ChooseDateTimeScreen> createState() => _ChooseDateTimeScreenState();
}

class _ChooseDateTimeScreenState extends State<ChooseDateTimeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.lightSky,
      appBar: BackHeaderWithoutLogo(),
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
                              PrimaryHeading(text: "Next..."),
                              SizedBox(height: 15),
                              PrimarySubheading(
                                text:
                                    "Let’s determine when your procedure is so we can start your prep on schedule.",
                                textColor: LightColors.gray200,
                              ),
                              SizedBox(height: 20),
                              TextFieldTitle(text: "Date"),
                              AppPrimaryDatePickerField(),
                              SizedBox(height: 20),
                              TextFieldTitle(text: "Time"),
                              AppPrimaryTimePickerField(),
                            ],
                          ),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: AppPrimaryButton(
                              buttonText: "Back",
                              backgroundColor: Colors.white,
                              textColor: LightColors.deepSky,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Spacer(),
                          Expanded(
                            child: AppPrimaryButton(
                              buttonText: "Next",
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ProcedureOverviewScreen(),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
