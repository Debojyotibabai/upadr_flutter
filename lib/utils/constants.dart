class Constants {
  static final Map<String, RegExp> regExp = {
    "emailAddress": RegExp(r'^[a-zA-Z0-9]+@[a-zA-Z]+\.[a-zA-Z]+'),
    "password": RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
  };
}
