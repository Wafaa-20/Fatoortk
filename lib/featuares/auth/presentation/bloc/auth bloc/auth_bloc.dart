import 'package:fatoortk/featuares/auth/domain/entities/app_user.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/current_user.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/sms_otp.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/user_sign_in.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/user_sign_up.dart';
import 'package:fatoortk/featuares/auth/domain/usecase/verify_sms_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  GlobalKey<FormState> singupFormKey = GlobalKey();
  GlobalKey<FormState> loginFormKey = GlobalKey();

  bool checkBoxValue = false;
   String countryCode = "+966"; 

  String? cachedName;
  String? cachedEmail;
  String? cachedPhoneNumber;

  String? verificationId;

  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final SmsOtp _smsOtp;
  final VerifySmsOtp _verifySmsOtp;
  final CurrentUser _currentUser;

  AuthBloc({
    required UserSignUp userSignUp,
    required UserSignIn userSignIn,
    required SmsOtp smsOtp,
    required VerifySmsOtp verifySmsOtp,
    required CurrentUser currentUser,
  })  : _userSignUp = userSignUp,
        _userSignIn = userSignIn,
        _smsOtp = smsOtp,
        _verifySmsOtp = verifySmsOtp,
        _currentUser = currentUser,
        super(AuthInitial()) {
    //send OTP
    on<SendSmsOtpEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await _smsOtp(SmsOtpParams(
        phoneNumber: event.phoneNumber,
      ));
      response.fold((failure) => emit(AuthFailure(failure.msg)),
          (verificationId) {
        if (verificationId == null) {
          emit(const AuthFailure("Failed to send OTP. Please try again."));
          return;
        }
        this.verificationId = verificationId;
        emit(SmsOtpSentState(verificationId));
      });
    });

    //Verify Sms Otp
    on<VerifySmsOtpEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await _verifySmsOtp(VerifySmsOtpParams(
        verificationId: event.verificationId,
        smsCode: event.smsCode,
      ));
      response.fold(
        (failure) => emit(AuthFailure(failure.msg)),
        (isVerified) {
          if (isVerified) {
            emit(SmsOtpVerifiedState());
          } else {
            emit(const AuthFailure("Invalid OTP. Please try again."));
          }
        },
      );
    });

    //CacheUserDataEvent to save data temp
    on<CacheUserDataEvent>((event, emit) async {
      cachedName = event.name;
      cachedEmail = event.email;
      cachedPhoneNumber = event.phoneNumber;
    });

    //Sign up
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoading());

      if (verificationId == null) {
        emit(const AuthFailure("Verification ID is missing!"));
        return;
      }
      final response = await _userSignUp(UserSignUpParams(
        // id: event.id!,
        verificationId: verificationId!,
        name: event.name,
        email: event.email,
        phoneNumber: event.phoneNumber,
        smsCode: event.smsCode,
      ));
      response.fold(
        (failure) => emit(AuthFailure(failure.msg)),
        (success) => emit(AuthSuccess(success!)),
      );
    });

    //Sign In

    on<AuthSignInEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await _userSignIn(UserSignInParams(
        id: event.id,
        phoneNumber: event.phoneNumber,
        smsCode: event.smsCode,
      ));
      response.fold(
        (failure) => emit(AuthFailure(failure.msg)),
        (user) => emit(AuthSuccess(user!)),
      );
    });

    // Get Current user
    on<CheckUserEvent>((event, emit) async {
      emit(AuthLoading());
      final userResponse = await _currentUser(CurrentUserParams(
        field: event.field,
        value: event.value,
      ));
      userResponse.fold((failure) => emit(AuthFailure(failure.msg)), (user) {
        if (user != null) {
          emit(UserExistState(user));
        } else {
          emit(UserNotExistState());
        }
      });
    });

    //UpdateTermsAndConditionsCheckbox
    on<UpdateTermsAndConditionsCheckboxEvent>((event, emit) {
      checkBoxValue = event.newValue;
      emit(CheckBoxUpdatedState(checkBoxValue));
    });

    on<UpdateCountryCodeEvent>((event, emit) {
      countryCode = event.countryCode;
      emit(CountryCodeUpdatedState(countryCode));
    });
  }
}
