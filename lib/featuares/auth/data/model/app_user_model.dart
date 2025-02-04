import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppUserModel extends AppUser {
  AppUserModel({
    required super.uId,
    required super.name,
    required super.email,
    required super.phoneNumber,
  });

  //convert App user model to -> json format
  Map<String, dynamic> toJson() {
    return {
      'id': uId,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }

  //convert json format -> App user model
  factory AppUserModel.fromJson(Map<String, dynamic> jsonUser) {
    return AppUserModel(
      uId: jsonUser['id'] as String,
      name: jsonUser['name'] as String,
      email: jsonUser['email'] as String,
      phoneNumber: jsonUser['phoneNumber'] as String,
    );
  }

  //convert firebase user ->  App user model
  factory AppUserModel.fromFirebaseUser(User user) {
    return AppUserModel(
      uId: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
      phoneNumber: user.phoneNumber ?? '',
    );
  }
  AppUserModel copyWith({
    String? uId,
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return AppUserModel(
      uId: uId ?? this.uId,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
