import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/core/usecase/usecase.dart';
import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:fatoortk/featuares/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class CurrentUser implements Usecase<AppUser, CurrentUserParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failures, AppUser?>> call(CurrentUserParams params) async {
    return await authRepository.getCurrentUser(
        field: params.field, value: params.value);
  }
}

class CurrentUserParams {
  final String field;
  final String value;

  CurrentUserParams({required this.field, required this.value});
}
