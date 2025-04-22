import 'package:upadr/features/app/my_procedure/data/model/all_procedures_reponse_model.dart';
import 'package:upadr/utils/api_services.dart';
import 'package:upadr/utils/endpoints.dart';

abstract class ProcedureDataSource {
  Future<AllProceduresResponseModel> getAllProcedures();
}

class ProcedureDataSourceImpl implements ProcedureDataSource {
  @override
  Future<AllProceduresResponseModel> getAllProcedures() async {
    try {
      final response = await APIService.instance.request(
        Endpoints.getAllProcedures,
        DioMethod.get,
      );

      return AllProceduresResponseModel.fromJson(response.data);
    } catch (err, s) {
      print(err.toString() + s.toString());
      throw (err as Map<String, dynamic>)["message"]!;
    }
  }
}
