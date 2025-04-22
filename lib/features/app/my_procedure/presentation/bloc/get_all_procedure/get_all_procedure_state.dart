part of 'get_all_procedure_bloc.dart';

@immutable
sealed class GetAllProcedureState {}

final class GetAllProcedureInitial extends GetAllProcedureState {}

final class GetAllProcedureLoading extends GetAllProcedureState {}

final class GetAllProcedureSuccess extends GetAllProcedureState {
  final AllProceduresResponseEntity response;

  GetAllProcedureSuccess({required this.response});
}

final class GetAllProcedureFailure extends GetAllProcedureState {
  final String error;

  GetAllProcedureFailure({required this.error});
}
