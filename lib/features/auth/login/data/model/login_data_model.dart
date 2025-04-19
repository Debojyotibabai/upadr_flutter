// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:upadr/features/auth/login/domain/entity/login_data_entity.dart';

LoginDataModel loginDataModelFromJson(String str) =>
    LoginDataModel.fromJson(json.decode(str));

class LoginDataModel extends LoginDataEntity {
  LoginDataModel({
    super.message,
    super.tokens,
    super.user,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        message: json["message"],
        tokens: json["tokens"] == null
            ? null
            : TokensModel.fromJson(json["tokens"]),
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      );
}

class TokensModel extends TokensEntity {
  TokensModel({
    super.accessToken,
    super.idToken,
    super.refreshToken,
    super.secretHash,
  });

  factory TokensModel.fromJson(Map<String, dynamic> json) => TokensModel(
        accessToken: json["accessToken"],
        idToken: json["idToken"],
        refreshToken: json["refreshToken"],
        secretHash: json["secretHash"],
      );
}

class UserModel extends UserEntity {
  UserModel({
    super.userId,
    super.userType,
    super.profilePictureUrl,
    super.firstName,
    super.lastName,
    super.profileImage,
    super.profileImageUrl,
    super.emailAddress,
    super.phoneCountryCode,
    super.phoneNumber,
    super.userSettings,
    super.accountStatus,
    super.registeredOn,
    super.numberOfUnreadNotifications,
    super.numberOfUnreadSurveys,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["userId"],
        userType: json["userType"],
        profilePictureUrl: json["profilePictureUrl"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        profileImage: json["profileImage"],
        profileImageUrl: json["profile_image_url"],
        emailAddress: json["emailAddress"],
        phoneCountryCode: json["phoneCountryCode"],
        phoneNumber: json["phoneNumber"],
        userSettings: json["userSettings"] == null
            ? null
            : UserSettingsModel.fromJson(json["userSettings"]),
        accountStatus: json["accountStatus"],
        registeredOn: json["registeredOn"] == null
            ? null
            : DateTime.parse(json["registeredOn"]),
        numberOfUnreadNotifications: json["numberOfUnreadNotifications"],
        numberOfUnreadSurveys: json["numberOfUnreadSurveys"],
      );
}

class UserSettingsModel extends UserSettingsEntity {
  UserSettingsModel({
    super.isAvailable,
    super.needToChangePassword,
  });

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      UserSettingsModel(
        isAvailable: json["isAvailable"],
        needToChangePassword: json["needToChangePassword"],
      );
}
