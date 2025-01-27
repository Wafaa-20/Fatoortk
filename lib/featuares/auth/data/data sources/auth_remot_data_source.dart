import 'dart:async';

import 'package:fatoortk/core/error/failures.dart';
import 'package:fatoortk/core/error/server_failure.dart';
import 'package:fatoortk/featuares/auth/data/model/app_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemotDataSource {
  Future<String?> smsOtp(String phoneNumber);

  Future<AppUserModel?> signUpWithPhoneNumber(
    String id,
    String name,
    String email,
    String phoneNumber,
    String smsCode,
  );

  Future<AppUserModel?> signInWithPhoneNumber(
    String phoneNumber,
    String smsCode,
  );

  Future<AppUserModel?> getCurrentUser();

  Future<void> logOut();
}

class AuthRemotDataSourceImpl implements AuthRemotDataSource {
  final FirebaseAuth firebaseAuth;

  AuthRemotDataSourceImpl({required this.firebaseAuth});

  @override
  Future<String?> smsOtp(String phoneNumber) async {
    final completer = Completer<String>();
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await firebaseAuth.signInWithCredential(credential);
          completer.complete('Verification completed');
        },
        verificationFailed: (FirebaseAuthException e) {
          completer.completeError(Failures('Verification failed ${e.message}'));
        },
        codeSent: (String verificationId, int? resendToken) async {
          completer.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          completer.complete(verificationId);
        },
      );
    } catch (e) {
      completer.completeError(throw ServerFailure(e.toString()));
    }
    return completer.future;
  }

  @override
  Future<AppUserModel?> signUpWithPhoneNumber(
    String id,
    String name,
    String email,
    String phoneNumber,
    String smsCode,
  ) async {
    try {
      
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: id,
        smsCode: smsCode,
      );
      final userCredential =
          await firebaseAuth.signInWithCredential(credential);

      if (userCredential.user == null) {
        throw ServerFailure('User is null!');
      }
      return AppUserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        smsCode: smsCode,
      );
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<AppUserModel?> signInWithPhoneNumber(
      String phoneNumber, String smsCode) async {
    try {
      final verificationId = await smsOtp(phoneNumber);
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: smsCode);
      final userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return AppUserModel(
        id: userCredential.user!.uid,
        name: userCredential.user?.displayName ?? '',
        email: userCredential.user?.email ?? '',
        phoneNumber: phoneNumber,
        smsCode: '',
      );
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> logOut() {
    return firebaseAuth.signOut();
  }

  @override
  Future<AppUserModel?> getCurrentUser() async {
    try {
      final firebaseUser = firebaseAuth.currentUser;
      if (firebaseUser == null) {
        return null;
      }
      return AppUserModel(
        id: firebaseUser.uid,
        name: '',
        email: firebaseUser.email ?? '',
        phoneNumber: firebaseUser.phoneNumber ?? '',
        smsCode: '',
      );
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }
}
