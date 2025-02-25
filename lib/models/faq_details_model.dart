class FaqDetailsModel {
  final int id;
  final String question;
  final String answer;
  final bool isOpened;

  FaqDetailsModel({
    required this.id,
    required this.question,
    required this.answer,
    this.isOpened = false,
  });
}
