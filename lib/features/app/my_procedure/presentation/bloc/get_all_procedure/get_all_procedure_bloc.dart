import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:upadr/config/no_param.dart';
import 'package:upadr/features/app/my_procedure/domain/entity/all_procedures_response_entity.dart';
import 'package:upadr/features/app/my_procedure/domain/use_case/get_all_procedure_use_case.dart';

part 'get_all_procedure_event.dart';

part 'get_all_procedure_state.dart';

class GetAllProcedureBloc
    extends Bloc<GetAllProcedureEvent, GetAllProcedureState> {
  final GetAllProcedureUseCase getAllProcedureUseCase;

  GetAllProcedureBloc({required this.getAllProcedureUseCase})
      : super(GetAllProcedureInitial()) {
    on<GetAllProcedures>((event, emit) async {
      emit(GetAllProcedureLoading());

      final response = await getAllProcedureUseCase(NoParam());

      response.fold(
        (err) => emit(GetAllProcedureFailure(error: err)),
        (res) => emit(GetAllProcedureSuccess(response: res)),
      );
    });
  }
}
