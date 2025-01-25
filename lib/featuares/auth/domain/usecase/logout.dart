import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/core/usecase/usecase.dart';
import 'package:fatoortk/featuares/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class Logout implements Usecase<void, LogoutParam> {
  final AuthRepository authRepository;
  Logout(this.authRepository);
  @override
  Future<Either<Failures, void>> call(params) async {
    return await authRepository.logout();
  }
}

class LogoutParam {}
