import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upadr/features/app/choose_procedure/presentation/pages/choose_procedure.dart';
import 'package:upadr/features/app/faq/presentation/pages/faq_listing.dart';
import 'package:upadr/features/app/my_procedure/presentation/bloc/get_all_procedure/get_all_procedure_bloc.dart';
import 'package:upadr/features/app/my_procedure/presentation/pages/procedure_overview.dart';
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

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAllProcedureBloc>(context).add(GetAllProcedures());
  }

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
      body: SafeArea(
        top: false,
        child: BlocBuilder<GetAllProcedureBloc, GetAllProcedureState>(
          builder: (context, getAllProcedureState) {
            if (getAllProcedureState is GetAllProcedureLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: LightColors.deepBlue,
                ),
              );
            } else if (getAllProcedureState is GetAllProcedureFailure) {
              return Center(
                child: Text("Something went wrong"),
              );
            } else if (getAllProcedureState is GetAllProcedureSuccess) {
              return Column(
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
                    child: getAllProcedureState
                            .response.upcomingUserProcedures.isEmpty
                        ? Center(
                            child: Text(
                              "There is no upcoming procedure found",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: LightColors.gray200,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: getAllProcedureState
                                .response.upcomingUserProcedures.length,
                            itemBuilder: (context, index) {
                              return MyProcedureCard(
                                title: getAllProcedureState
                                    .response
                                    .upcomingUserProcedures[index]
                                    .procedure
                                    .title,
                                onPress: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProcedureOverviewScreen(),
                                    ),
                                  );
                                },
                              );
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
                    child: getAllProcedureState
                            .response.completedUserProcedures.isEmpty
                        ? Center(
                            child: Text(
                              "There is no completed procedure found",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: LightColors.gray200,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: getAllProcedureState
                                .response.completedUserProcedures.length,
                            itemBuilder: (context, index) {
                              return MyProcedureCard(
                                title: getAllProcedureState
                                    .response
                                    .completedUserProcedures[index]
                                    .procedure
                                    .title,
                                onPress: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ProcedureOverviewScreen(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25)
                        .copyWith(bottom: 25),
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
                                  builder: (context) =>
                                      const FaqListingScreen(),
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
                                  builder: (context) =>
                                      const ChooseProcedureScreen(),
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
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
