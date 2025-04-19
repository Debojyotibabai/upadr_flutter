class LoginDataEntity {
  String? message;
  TokensEntity? tokens;
  UserEntity? user;

  LoginDataEntity({
    required this.message,
    required this.tokens,
    required this.user,
  });
}

class TokensEntity {
  String? accessToken;
  String? idToken;
  String? refreshToken;
  String? secretHash;

  TokensEntity({
    required this.accessToken,
    required this.idToken,
    required this.refreshToken,
    required this.secretHash,
  });
}

class UserEntity {
  String? userId;
  String? userType;
  dynamic profilePictureUrl;
  String? firstName;
  String? lastName;
  dynamic profileImage;
  dynamic profileImageUrl;
  String? emailAddress;
  dynamic phoneCountryCode;
  dynamic phoneNumber;
  UserSettingsEntity? userSettings;
  String? accountStatus;
  DateTime? registeredOn;
  int? numberOfUnreadNotifications;
  int? numberOfUnreadSurveys;

  UserEntity({
    required this.userId,
    required this.userType,
    required this.profilePictureUrl,
    required this.firstName,
    required this.lastName,
    required this.profileImage,
    required this.profileImageUrl,
    required this.emailAddress,
    required this.phoneCountryCode,
    required this.phoneNumber,
    required this.userSettings,
    required this.accountStatus,
    required this.registeredOn,
    required this.numberOfUnreadNotifications,
    required this.numberOfUnreadSurveys,
  });
}

class UserSettingsEntity {
  bool? isAvailable;
  bool? needToChangePassword;

  UserSettingsEntity({
    required this.isAvailable,
    required this.needToChangePassword,
  });
}
