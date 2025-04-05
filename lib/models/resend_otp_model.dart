class ResendOtpModel {
  final String emailAddress;
  final String userType;

  ResendOtpModel({
    required this.emailAddress,
    this.userType = "Consumer",
  });
}
