import 'package:flutter/material.dart';
import 'package:upadr/features/app/faq/presentation/pages/particular_faq.dart';
import 'package:upadr/features/app/faq/presentation/widgets/faq_card.dart';
import 'package:upadr/widgets/custom_drawer.dart';
import 'package:upadr/widgets/header/drawer_header_with_logo.dart';
import 'package:upadr/widgets/text/primary_heading.dart';

class FaqListingScreen extends StatefulWidget {
  const FaqListingScreen({super.key});

  @override
  State<FaqListingScreen> createState() => _FaqListingScreenState();
}

class _FaqListingScreenState extends State<FaqListingScreen> {
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
            child: PrimaryHeading(text: "FAQs and Tips"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return FaqCard(
                  text: "Procedure ${index + 1}",
                  onPress: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ParticularFaqScreen(),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
