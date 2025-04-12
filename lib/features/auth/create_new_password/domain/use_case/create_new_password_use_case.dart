import 'package:either_dart/either.dart';
import 'package:upadr/config/use_case.dart';
import 'package:upadr/features/auth/create_new_password/domain/repository/create_new_password_repository.dart';
import 'package:upadr/models/create_new_password_model.dart';

class CreateNewPasswordUseCase
    implements UseCase<String, String, CreateNewPasswordModel> {
  final CreateNewPasswordRepository createNewPasswordRepositoryImpl;

  CreateNewPasswordUseCase({required this.createNewPasswordRepositoryImpl});

  @override
  Future<Either<String, String>> call(
      CreateNewPasswordModel createNewPasswordModel) async {
    return await createNewPasswordRepositoryImpl
        .createNewPassword(createNewPasswordModel);
  }
}
