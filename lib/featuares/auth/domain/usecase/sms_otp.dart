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
      name: params.name,
      email: params.email,
      phoneNumber: params.phoneNumber,
    );
  }
}

class SmsOtpParams {
  final String? name;
  final String? email;
  final String phoneNumber;

  SmsOtpParams({this.name, this.email, required this.phoneNumber});
}
