import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<Failures, String?>> smsOtp({
    required String phoneNumber,
  });

  Future<Either<Failures, AppUser?>> singUpWithPhoneNumber(
      {required String id,
      required String name,
      required String email,
      required String phoneNumber,
      required String smsCode});

  Future<Either<Failures, AppUser?>> signInWithPhoneNumber({
    required String phoneNumber,
    required String smsCode,
  });

  Future<Either<Failures, void>> logout();

  Future<Either<Failures, AppUser?>> getCurrentUser();
}
