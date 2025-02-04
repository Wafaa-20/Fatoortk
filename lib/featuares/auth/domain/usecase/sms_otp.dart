import 'package:equatable/equatable.dart';
import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/core/usecase/usecase.dart';
import 'package:fatoortk/featuares/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class SmsOtp implements Usecase<String, SmsOtpParams> {
  final AuthRepository authRepository;
  SmsOtp(this.authRepository);
  @override
  Future<Either<Failures, String?>> call(params) async {
    return await authRepository.smsOtp(
      phoneNumber: params.phoneNumber,
    );
  }
}

class SmsOtpParams extends Equatable {
  final String phoneNumber;

  const SmsOtpParams({required this.phoneNumber});

  @override
  List<Object> get props => [phoneNumber];
}
