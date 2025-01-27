import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/core/usecase/usecase.dart';
import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:fatoortk/featuares/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignIn implements Usecase<AppUser, UserSignInParams> {
  final AuthRepository authRepository;
  UserSignIn(this.authRepository);

  @override
  Future<Either<Failures, AppUser?>> call(UserSignInParams params) async {
    return await authRepository.signInWithPhoneNumber(
      id: params.id,
      phoneNumber: params.phoneNumber,
      smsCode: params.smsCode,
    );
  }
}

class UserSignInParams {
  final String id;
  final String phoneNumber;
  final String smsCode;

  UserSignInParams({
    required this.id,
    required this.phoneNumber,
    required this.smsCode,
  });
}
