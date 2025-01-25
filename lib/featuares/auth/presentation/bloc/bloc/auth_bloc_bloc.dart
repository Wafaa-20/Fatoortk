import 'package:fatoortk/featuares/auth/domain/usecase/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  AuthBlocBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSingUp>((event, emit) async {
      await _userSignUp(UserSignUpParams(
        name: event.name,
        email: event.email,
        phoneNumber: event.phoneNumber,
        id: event.id,
        smsCode: event.smsCode,
      ));
    });
  }
}
