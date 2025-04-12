import 'package:either_dart/either.dart';
import 'package:upadr/features/auth/create_new_password/data/data_source/create_new_password_data_source.dart';
import 'package:upadr/features/auth/create_new_password/domain/repository/create_new_password_repository.dart';
import 'package:upadr/models/create_new_password_model.dart';

class CreateNewPasswordRepositoryImpl implements CreateNewPasswordRepository {
  final CreateNewPasswordDataSource createNewPasswordDataSourceImpl;

  CreateNewPasswordRepositoryImpl(
      {required this.createNewPasswordDataSourceImpl});

  @override
  Future<Either<String, String>> createNewPassword(
      CreateNewPasswordModel createNewPasswordModel) async {
    try {
      final response = await createNewPasswordDataSourceImpl
          .createNewPassword(createNewPasswordModel);

      return Right(response);
    } catch (err) {
      return Left(err.toString());
    }
  }
}
