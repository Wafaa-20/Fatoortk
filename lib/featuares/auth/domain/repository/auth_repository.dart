import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';

abstract class AuthRepository {

  Future<AppUser?>loginWithPhoneNumber(String phoneNumber)async{}
  Future<AppUser?>singupWithPhoneNumber(String name,String email,String phoneNumber)async{
    
  }
}