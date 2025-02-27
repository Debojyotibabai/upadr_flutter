import 'package:flutter/material.dart';
import 'package:upadr/styles/light_colors.dart';
import 'package:upadr/widgets/button/app_primary_button.dart';
import 'package:upadr/widgets/header/back_header_with_notification.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/text_field_title.dart';
import 'package:upadr/widgets/text_field/app_primary_date_picker_field.dart';
import 'package:upadr/widgets/text_field/app_primary_time_picker_field.dart';

class EditProcedureScreen extends StatefulWidget {
  const EditProcedureScreen({super.key});

  @override
  State<EditProcedureScreen> createState() => _EditProcedureScreenState();
}

class _EditProcedureScreenState extends State<EditProcedureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackHeaderWithNotification(),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryHeading(text: "Edit Your Procedure"),
                  SizedBox(height: 20),
                  TextFieldTitle(text: "Procedure Name"),
                  Container(
                    padding: EdgeInsets.all(15),
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
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "My Procedure",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Inter",
                              color: LightColors.gray200,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: LightColors.gray200,
                        ),
                      ],
                    ),
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  Spacer(),
                  Expanded(
                    child: AppPrimaryButton(
                      buttonText: "Done",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
