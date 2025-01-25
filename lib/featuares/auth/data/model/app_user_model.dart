import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUserModel extends AppUser {
  AppUserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.smsCode,
  });

  //convert App user model to -> json format
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'smsCode': smsCode,
    };
  }

  //convert json format -> App user model
  factory AppUserModel.fromJson(Map<String, dynamic> jsonUser) {
    return AppUserModel(
      id: jsonUser['id'],
      name: jsonUser['name'],
      email: jsonUser['email'],
      phoneNumber: jsonUser['phoneNumber'],
      smsCode: jsonUser['smsCode'],
    );
  }

  //convert firebase user ->  App user model
  factory AppUserModel.fromFirebaseUser(User user) {
    return AppUserModel(
      id: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      phoneNumber: user.phoneNumber ?? '',
      smsCode: '',
    );
  }
}
