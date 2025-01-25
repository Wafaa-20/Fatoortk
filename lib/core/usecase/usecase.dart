import 'package:fatoortk/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract class Usecase<SuccessType, Params> {
  Future<Either<Failures, SuccessType?>> call(Params params);
}
