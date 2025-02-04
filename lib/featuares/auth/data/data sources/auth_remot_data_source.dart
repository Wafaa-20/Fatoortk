import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatoortk/core/error/server_failure.dart';
import 'package:fatoortk/featuares/auth/data/model/app_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemotDataSource {
  Future<String?> smsOtp(String phoneNumber);

  Future<bool> verifySmsOtp(String verificationId, String smsCode);

  Future<AppUserModel?> signUpWithPhoneNumber(
    String verificationId,
    String name,
    String email,
    String phoneNumber,
    String smsCode,
  );

  Future<AppUserModel?> signInWithPhoneNumber(
    String verificationId,
    String phoneNumber,
    String smsCode,
  );

  Future<AppUserModel?> getCurrentUser(
    String field,
    String value,
  );
  Future<void> logOut();
}

class AuthRemotDataSourceImpl implements AuthRemotDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRemotDataSourceImpl({
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

//Sent SMS OTP
  @override
  Future<String?> smsOtp(String phoneNumber) async {
    final completer = Completer<String>();

    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        // timeout: const Duration(seconds: 60),
        verificationCompleted: (credential) async {
          completer.complete('Verification completed');
        },
        verificationFailed: (FirebaseAuthException e) {
          if (!completer.isCompleted) {
            completer.completeError(
                ServerFailure('Verification failed: ${e.message}'));
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          if (!completer.isCompleted) {
            completer.complete(verificationId);
          }
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          if (!completer.isCompleted) {
            completer.complete(verificationId);
          }
        },
      );
    } catch (e) {
      if (!completer.isCompleted) {
        completer.completeError(ServerFailure('Failed to send SMS OTP: $e'));
      }
    }
    return completer.future;
  }

// Verify Sms Otp
  @override
  Future<bool> verifySmsOtp(
    String verificationId,
    String smsCode,
  ) async {
    try {
      if (verificationId.isEmpty) {
        throw ServerFailure('Verification ID is missing!');
      }
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final userCredential =
          await firebaseAuth.signInWithCredential(credential);
      return userCredential.user != null;
    } catch (e) {
      throw ServerFailure('OTP verification failed: $e');
    }
  }

  @override
  Future<AppUserModel> signUpWithPhoneNumber(
    String verificationId,
    String name,
    String email,
    String phoneNumber,
    String smsCode,
  ) async {
    try {
      final userId = firebaseAuth.currentUser;
      if (userId == null) {
        throw ServerFailure('User is null!');
      }

      AppUserModel user = AppUserModel(
        uId: userId.uid,
        name: name,
        email: email,
        phoneNumber: phoneNumber,
      );
      //add user to fireStore
      await firebaseFirestore
          .collection('users')
          .doc(user.uId)
          .set(user.toJson());

      return user;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<AppUserModel> signInWithPhoneNumber(
    String verificationId,
    String phoneNumber,
    String smsCode,
  ) async {
    try {
      final isVerified = await verifySmsOtp(verificationId, smsCode);
      if (!isVerified) {
        throw ServerFailure('OTP verification failed!');
      }
      final userId = firebaseAuth.currentUser;
      if (userId == null) {
        throw ServerFailure('User is null!');
      }

      final userInfo =
          await firebaseFirestore.collection('users').doc(userId.uid).get();
      if (!userInfo.exists) {
        throw ServerFailure('User data not found in Firestore!');
      }

      return AppUserModel.fromJson(userInfo.data()!);
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<AppUserModel?> getCurrentUser(String field, String value) async {
    try {
      final userInfo = await firebaseFirestore
          .collection('users')
          .where(field, isEqualTo: value)
          .limit(1)
          .get();
      if (userInfo.docs.isEmpty) {
        return null;
      }

      return AppUserModel.fromJson(userInfo.docs.first.data());
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<void> logOut() {
    return firebaseAuth.signOut();
  }
}
