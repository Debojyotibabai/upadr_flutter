class ForgotPasswordModel {
  final String emailAddress;
  final String userType;

  ForgotPasswordModel({
    required this.emailAddress,
    this.userType = "Consumer",
  });
}
