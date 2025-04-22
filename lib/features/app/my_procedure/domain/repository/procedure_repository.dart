import 'package:either_dart/either.dart';
import 'package:upadr/features/app/my_procedure/domain/entity/all_procedures_response_entity.dart';

abstract class ProcedureRepository {
  Future<Either<String, AllProceduresResponseEntity>> getAllProcedures();
}
