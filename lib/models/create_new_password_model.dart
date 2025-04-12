class CreateNewPasswordModel {
  final String confirmPassword;
  final String emailAddress;
  final String newPassword;
  final String resetCode;
  final String userType;

  CreateNewPasswordModel({
    required this.confirmPassword,
    required this.emailAddress,
    required this.newPassword,
    required this.resetCode,
    this.userType = "Consumer",
  });
}
