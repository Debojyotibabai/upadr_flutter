// To parse this JSON data, do
//
//     final allProceduresResponseModel = allProceduresResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:upadr/features/app/my_procedure/domain/entity/all_procedures_response_entity.dart';

AllProceduresResponseModel allProceduresResponseModelFromJson(String str) =>
    AllProceduresResponseModel.fromJson(json.decode(str));

class AllProceduresResponseModel extends AllProceduresResponseEntity {
  AllProceduresResponseModel({
    required super.upcomingUserProcedures,
    required super.completedUserProcedures,
  });

  factory AllProceduresResponseModel.fromJson(Map<String, dynamic> json) =>
      AllProceduresResponseModel(
        upcomingUserProcedures: List<UserProcedureModel>.from(
            json["upcomingUserProcedures"]
                .map((x) => UserProcedureModel.fromJson(x))),
        completedUserProcedures: List<UserProcedureModel>.from(
            json["completedUserProcedures"]
                .map((x) => UserProcedureModel.fromJson(x))),
      );
}

class UserProcedureModel extends UserProcedureEntity {
  UserProcedureModel({
    required super.userProcedureId,
    required super.procedure,
    required super.procedureSet,
    required super.dateTime,
  });

  factory UserProcedureModel.fromJson(Map<String, dynamic> json) =>
      UserProcedureModel(
        userProcedureId: json["userProcedureId"],
        procedure: ProcedureModel.fromJson(json["procedure"]),
        procedureSet: ProcedureSetModel.fromJson(json["procedureSet"]),
        dateTime: DateTime.parse(json["dateTime"]),
      );
}

class ProcedureModel extends ProcedureEntity {
  ProcedureModel({
    required super.procedureId,
    required super.title,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.numberOfDefaultSteps,
    required super.numberOfTotalSteps,
    required super.numberOfSets,
    required super.steps,
  });

  factory ProcedureModel.fromJson(Map<String, dynamic> json) => ProcedureModel(
        procedureId: json["procedureId"],
        title: json["title"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"],
        numberOfDefaultSteps: json["numberOfDefaultSteps"],
        numberOfTotalSteps: json["numberOfTotalSteps"],
        numberOfSets: json["numberOfSets"],
        steps: List<StepModel>.from(
            json["steps"].map((x) => StepModel.fromJson(x))),
      );
}

class StepModel extends StepEntity {
  StepModel({
    required super.procedureStepId,
    required super.procedureSet,
    required super.procedureStepImageUrl,
    required super.when,
    required super.isBeforeProcedure,
    required super.description,
    required super.createdAt,
    required super.updatedAt,
    required super.notificationTriggerTime,
    required super.contentViewedAt,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) => StepModel(
        procedureStepId: json["procedureStepId"],
        procedureSet: ProcedureSetModel.fromJson(json["procedureSet"]),
        procedureStepImageUrl: json["procedureStepImageUrl"],
        when: json["when"],
        isBeforeProcedure: json["isBeforeProcedure"],
        description: json["description"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        notificationTriggerTime:
            DateTime.parse(json["notificationTriggerTime"]),
        contentViewedAt: json["contentViewedAt"],
      );
}

class ProcedureSetModel extends ProcedureSetEntity {
  ProcedureSetModel({
    required super.procedureSetId,
    required super.setName,
  });

  factory ProcedureSetModel.fromJson(Map<String, dynamic> json) =>
      ProcedureSetModel(
        procedureSetId: json["procedureSetId"],
        setName: json["setName"],
      );
}
