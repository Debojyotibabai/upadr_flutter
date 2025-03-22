// To parse this JSON data, do
//
//     final loginDataModel = loginDataModelFromJson(jsonString);

import 'dart:convert';

import 'package:upadr/features/auth/login/domain/entity/login_data_entity.dart';

LoginDataModel loginDataModelFromJson(String str) =>
    LoginDataModel.fromJson(json.decode(str));

class LoginDataModel extends LoginDataEntity {
  LoginDataModel({
    required super.message,
    required super.tokens,
    required super.user,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        message: json["message"],
        tokens: TokensModel.fromJson(json["tokens"]),
        user: UserModel.fromJson(json["user"]),
      );
}

class TokensModel extends TokensEntity {
  TokensModel({
    required super.accessToken,
    required super.idToken,
    required super.refreshToken,
    required super.secretHash,
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
    required super.userId,
    required super.userType,
    required super.profilePictureUrl,
    required super.firstName,
    required super.lastName,
    required super.profileImage,
    required super.profileImageUrl,
    required super.emailAddress,
    required super.phoneCountryCode,
    required super.phoneNumber,
    required super.userSettings,
    required super.accountStatus,
    required super.registeredOn,
    required super.numberOfUnreadNotifications,
    required super.numberOfUnreadSurveys,
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
        userSettings: UserSettingsModel.fromJson(json["userSettings"]),
        accountStatus: json["accountStatus"],
        registeredOn: DateTime.parse(json["registeredOn"]),
        numberOfUnreadNotifications: json["numberOfUnreadNotifications"],
        numberOfUnreadSurveys: json["numberOfUnreadSurveys"],
      );
}

class UserSettingsModel extends UserSettingsEntity {
  UserSettingsModel({
    required super.isAvailable,
    required super.needToChangePassword,
  });

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) =>
      UserSettingsModel(
        isAvailable: json["isAvailable"],
        needToChangePassword: json["needToChangePassword"],
      );
}
