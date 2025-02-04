import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/core/error/server_failure.dart';
import 'package:fatoortk/featuares/auth/data/data%20sources/auth_remot_data_source.dart';
import 'package:fatoortk/featuares/auth/data/model/app_user_model.dart';
import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:fatoortk/featuares/auth/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemotDataSource remotDataSource;

  AuthRepositoryImpl({required this.remotDataSource});

  @override
  Future<Either<Failures, String>> smsOtp({
    required String phoneNumber,
  }) async {
    try {
      final verificationId = await remotDataSource.smsOtp(
        phoneNumber,
      );
      return right(verificationId!);
    } on ServerFailure catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, bool>> verifySmsOtp({
    required String verificationId,
    required String smsCode,
  }) async {
    try {
      final isVerified =
          await remotDataSource.verifySmsOtp(verificationId, smsCode);
      return right(isVerified);
    } on ServerFailure catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, AppUser>> signUpWithPhoneNumber({
    required String verificationId,
    required String name,
    required String email,
    required String phoneNumber,
    required String smsCode,
  }) async {
    try {
      final userId = await remotDataSource.signUpWithPhoneNumber(
        verificationId,
        name,
        email,
        phoneNumber,
        smsCode,
      );
      return Right(userId!);
    } on ServerFailure catch (e) {
      return Left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, AppUserModel?>> signInWithPhoneNumber({
    required String verificationId,
    required String phoneNumber,
    required String smsCode,
  }) async {
    try {
      final user = await remotDataSource.signInWithPhoneNumber(
        verificationId,
        phoneNumber,
        smsCode,
      );
      return right(user);
    } on ServerFailure catch (e) {
      return left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, AppUserModel>> getCurrentUser(
      {required String field, required String value}) async {
    try {
      final user = await remotDataSource.getCurrentUser(
        field,
        value,
      );
      return Right(user!);
    } on ServerFailure catch (e) {
      return Left(Failures(e.message));
    }
  }

  @override
  Future<Either<Failures, void>> logout() async {
    try {
      await remotDataSource.logOut();
      return right(null);
    } on ServerFailure catch (e) {
      return left(Failures(e.message));
    }
  }
}
