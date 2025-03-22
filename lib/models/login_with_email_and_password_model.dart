class LoginWithEmailAndPasswordModel {
  final String emailAddress;
  final String password;
  final String userType;

  LoginWithEmailAndPasswordModel({
    required this.emailAddress,
    required this.password,
    this.userType = "Consumer",
  });
}
