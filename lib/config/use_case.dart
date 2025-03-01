import 'package:either_dart/either.dart';

abstract interface class UseCase<SuccessType, FailureType, Params> {
  Future<Either<FailureType, SuccessType>> call(Params params);
}
