class SignupWithEmailAndPasswordModel {
  final String confirmPassword;
  final String emailAddress;
  final String firstName;
  final String lastName;
  final String password;
  final String userType;

  SignupWithEmailAndPasswordModel({
    required this.confirmPassword,
    required this.emailAddress,
    required this.firstName,
    required this.lastName,
    required this.password,
    this.userType = "Consumer",
  });
}
