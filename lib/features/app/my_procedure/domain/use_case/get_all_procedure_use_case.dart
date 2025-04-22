import 'package:either_dart/either.dart';
import 'package:upadr/config/no_param.dart';
import 'package:upadr/config/use_case.dart';
import 'package:upadr/features/app/my_procedure/domain/entity/all_procedures_response_entity.dart';
import 'package:upadr/features/app/my_procedure/domain/repository/procedure_repository.dart';

class GetAllProcedureUseCase
    implements UseCase<AllProceduresResponseEntity, String, NoParam> {
  final ProcedureRepository procedureRepositoryImpl;

  GetAllProcedureUseCase({required this.procedureRepositoryImpl});

  @override
  Future<Either<String, AllProceduresResponseEntity>> call(
      NoParam param) async {
    return await procedureRepositoryImpl.getAllProcedures();
  }
}
