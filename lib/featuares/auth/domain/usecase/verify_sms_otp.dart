import 'package:equatable/equatable.dart';
import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/core/usecase/usecase.dart';
import 'package:fatoortk/featuares/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class VerifySmsOtp implements Usecase<bool, VerifySmsOtpParams> {
  final AuthRepository authRepository;

  VerifySmsOtp(this.authRepository);
  @override
  Future<Either<Failures, bool>> call(VerifySmsOtpParams params) async {
    return await authRepository.verifySmsOtp(
      verificationId: params.verificationId,
      smsCode: params.smsCode,
    );
  }
}

class VerifySmsOtpParams extends Equatable {
  final String verificationId;
  final String smsCode;

  const VerifySmsOtpParams({required this.verificationId, required this.smsCode});

  @override
  List<Object> get props => [verificationId, smsCode];
}
