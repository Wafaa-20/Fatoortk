import 'package:equatable/equatable.dart';
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
      verificationId: params.verificationId,
      name: params.name,
      email: params.email,
      phoneNumber: params.phoneNumber,
      smsCode: params.smsCode,
    );
  }
}

class UserSignUpParams extends Equatable {
  final String verificationId;
  final String name;
  final String email;
  final String phoneNumber;
  final String smsCode;

  const UserSignUpParams({
    required this.verificationId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.smsCode,
  });

  @override
  List<Object> get props => [verificationId, name, email, phoneNumber, smsCode];
}
