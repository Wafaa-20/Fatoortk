import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/sms_otp.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/user_sign_in.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  GlobalKey<FormState> singupFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();
  bool checkBoxValue = false;

  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final SmsOtp _smsOtp;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required SmsOtp smsOtp,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _smsOtp = smsOtp,
        super(AuthInitial()) {
    //send OTP
    on<SendSmsOtpEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await _smsOtp(SmsOtpParams(
        phoneNumber: event.phoneNumber,
      ));
      response.fold(
        (failure) => emit(AuthFailure(failure.msg)),
        (verificationId) => emit(SmsOtpSentState(verificationId!)),
      );
    });

    //Sign up
    on<AuthSingUpEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await _userSignUp(UserSignUpParams(
        id: event.id!,
        name: event.name,
        email: event.email,
        phoneNumber: event.phoneNumber,
        smsCode: event.smsCode!,
      ));
      response.fold(
        (failure) => emit(AuthFailure(failure.msg)),
        (success) => emit(AuthSuccess(success)),
      );
    });

    on<AuthSingInEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await _userSignIn(UserSignInParams(
        id: event.id,
        phoneNumber: event.phoneNumber,
        smsCode: event.smsCode,
      ));
      response.fold(
        (failure) => emit(AuthFailure(failure.msg)),
        (success) => emit(AuthSuccess(success)),
      );
    });

    on<UpdateTermsAndConditionsCheckboxEvent>((event, emit) {
      checkBoxValue = event.newValue;
      emit(CheckBoxUpdatedState(checkBoxValue));
    });
  }
}
