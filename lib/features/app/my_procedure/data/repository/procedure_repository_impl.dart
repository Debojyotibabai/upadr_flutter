import 'package:either_dart/either.dart';
import 'package:upadr/features/app/my_procedure/data/data_source/procedure_data_source.dart';
import 'package:upadr/features/app/my_procedure/data/model/all_procedures_reponse_model.dart';
import 'package:upadr/features/app/my_procedure/domain/repository/procedure_repository.dart';

class ProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource procedureDataSourceImpl;

  ProcedureRepositoryImpl({required this.procedureDataSourceImpl});

  @override
  Future<Either<String, AllProceduresResponseModel>> getAllProcedures() async {
    try {
      final response = await procedureDataSourceImpl.getAllProcedures();

      return Right(response);
    } catch (err) {
      return Left(err.toString());
    }
  }
}
