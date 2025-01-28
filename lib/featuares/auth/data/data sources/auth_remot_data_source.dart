import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
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
    String id,
    String smsCode,
  );

  Future<AppUserModel?> getCurrentUser();

  Future<void> logOut();
}

class AuthRemotDataSourceImpl implements AuthRemotDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  AuthRemotDataSourceImpl(
      {required this.firebaseAuth, required this.firebaseFirestore});

  @override
  Future<String?> smsOtp(String phoneNumber) async {
    final completer = Completer<String>();
    try {
      await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (credential) async {
          completer.complete('Verification completed');
        },
        verificationFailed: (FirebaseAuthException e) {
          completer.completeError(
              ServerFailure('Verification failed: ${e.message}'));
        },
        codeSent: (String verificationId, int? resendToken) async {
          completer.complete(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          completer.complete(verificationId);
        },
      );
    } catch (e) {
      completer.completeError(ServerFailure('Failed to send SMS OTP: $e'));
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
      final userId = userCredential.user?.uid;

      if (userId == null) {
        throw ServerFailure('User is null!');
      } 

      AppUserModel user = AppUserModel(
        id: userId,
        name: name,
        email: email,
        phoneNumber:phoneNumber ,
        smsCode: smsCode,
      );

      //add user to firebase
      await firebaseFirestore
          .collection('users')
          .doc(user.id)
          .set(user.toJson());

      return user;
    } catch (e) {
      throw ServerFailure(e.toString());
    }
  }

  @override
  Future<AppUserModel?> signInWithPhoneNumber(
    String id,
    String smsCode,
  ) async {
    try {
      // final verificationId = await smsOtp(phoneNumber);
      // if (verificationId == null) {
      //   throw ServerFailure('Failed to retrieve verification ID');
      // }

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
        name: '',
        email: '',
        phoneNumber: '',
        smsCode: smsCode,
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
