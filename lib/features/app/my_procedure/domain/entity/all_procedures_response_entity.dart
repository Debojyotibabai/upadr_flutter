class AllProceduresResponseEntity {
  List<UserProcedureEntity> upcomingUserProcedures;
  List<UserProcedureEntity> completedUserProcedures;

  AllProceduresResponseEntity({
    required this.upcomingUserProcedures,
    required this.completedUserProcedures,
  });
}

class UserProcedureEntity {
  String userProcedureId;
  ProcedureEntity procedure;
  ProcedureSetEntity procedureSet;
  DateTime dateTime;

  UserProcedureEntity({
    required this.userProcedureId,
    required this.procedure,
    required this.procedureSet,
    required this.dateTime,
  });
}

class ProcedureEntity {
  String procedureId;
  String title;
  String status;
  DateTime createdAt;
  dynamic updatedAt;
  int numberOfDefaultSteps;
  int numberOfTotalSteps;
  int numberOfSets;
  List<StepEntity> steps;

  ProcedureEntity({
    required this.procedureId,
    required this.title,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.numberOfDefaultSteps,
    required this.numberOfTotalSteps,
    required this.numberOfSets,
    required this.steps,
  });
}

class StepEntity {
  String procedureStepId;
  ProcedureSetEntity procedureSet;
  String procedureStepImageUrl;
  String when;
  bool isBeforeProcedure;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime notificationTriggerTime;
  dynamic contentViewedAt;

  StepEntity({
    required this.procedureStepId,
    required this.procedureSet,
    required this.procedureStepImageUrl,
    required this.when,
    required this.isBeforeProcedure,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.notificationTriggerTime,
    required this.contentViewedAt,
  });
}

class ProcedureSetEntity {
  String? procedureSetId;
  String setName;

  ProcedureSetEntity({
    required this.procedureSetId,
    required this.setName,
  });
}
