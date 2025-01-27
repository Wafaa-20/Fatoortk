import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/core/usecase/usecase.dart';
import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:fatoortk/featuares/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUp implements Usecase<AppUser, UserSignUpParams> {
  final AuthRepository authRepository;
  UserSignUp(this.authRepository);

  @override
  Future<Either<Failures, AppUser?>> call(UserSignUpParams params) async {
    return await authRepository.signUpWithPhoneNumber(
      id: params.id,
      name: params.name,
      email: params.email,
      phoneNumber: params.phoneNumber,
      smsCode: params.smsCode,
    );
  }
}

class UserSignUpParams {
  final String? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String smsCode;

  UserSignUpParams({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.smsCode,
  });
}
