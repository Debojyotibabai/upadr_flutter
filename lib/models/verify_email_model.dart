class VerifyEmailModel {
  final String confirmationCode;
  final String emailAddress;
  final String password;
  final String userType;

  VerifyEmailModel({
    required this.confirmationCode,
    required this.emailAddress,
    required this.password,
    this.userType = "Consumer",
  });
}
