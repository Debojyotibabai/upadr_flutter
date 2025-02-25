import 'package:flutter/material.dart';
import 'package:upadr/features/app/faq/presentation/widgets/expandable_faq_card.dart';
import 'package:upadr/models/faq_details_model.dart';
import 'package:upadr/widgets/header/back_header_with_notification.dart';
import 'package:upadr/widgets/text/primary_heading.dart';
import 'package:upadr/widgets/text/primary_subheading.dart';

class ParticularFaqScreen extends StatefulWidget {
  const ParticularFaqScreen({super.key});

  @override
  State<ParticularFaqScreen> createState() => _ParticularFaqScreenState();
}

class _ParticularFaqScreenState extends State<ParticularFaqScreen> {
  List<FaqDetailsModel> faqs = [
    FaqDetailsModel(
      id: 1,
      question: 'Lorem ipsum dolor sit amet, consectetur?',
      answer:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ',
    ),
    FaqDetailsModel(
      id: 2,
      question: 'Lorem ipsum dolor sit amet, consectetur?',
      answer:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ',
    ),
    FaqDetailsModel(
      id: 3,
      question: 'Lorem ipsum dolor sit amet, consectetur?',
      answer:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ',
    ),
    FaqDetailsModel(
      id: 4,
      question: 'Lorem ipsum dolor sit amet, consectetur?',
      answer:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ',
    ),
    FaqDetailsModel(
      id: 5,
      question: 'Lorem ipsum dolor sit amet, consectetur?',
      answer:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackHeaderWithNotification(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryHeading(text: "FAQs and Tips"),
                SizedBox(height: 10),
                PrimarySubheading(
                  text: "Here are some FAQs and Tips for a Procedure 1",
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return ExpandableFaqCard(
                    question: faqs[index].question,
                    answer: faqs[index].answer,
                    isOpened: faqs[index].isOpened,
                    onPress: () {
                      final updatedFaqs = faqs.map((item) {
                        if (item.id == faqs[index].id) {
                          return FaqDetailsModel(
                            id: faqs[index].id,
                            question: faqs[index].question,
                            answer: faqs[index].answer,
                            isOpened: !faqs[index].isOpened,
                          );
                        } else {
                          return item;
                        }
                      }).toList();

                      setState(() {
                        faqs = updatedFaqs;
                      });
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}
