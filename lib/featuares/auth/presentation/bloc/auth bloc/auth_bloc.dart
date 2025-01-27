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
        (success) => emit(AuthSuccess(success!)),
      );
    });

    on<AuthSingInEvent>((event, emit) async {
      final response = await _userSignIn(UserSignInParams(
        phoneNumber: event.phoneNumber,
        smsCode: event.smsCode!,
      ));
      response.fold(
        (failure) => emit(AuthFailure(failure.msg)),
        (success) => emit(AuthSuccess(success)),
      );
    });

    on<SendSmsOtpEvent>((event, emit) async {
      final response =
          await _smsOtp(SmsOtpParams(phoneNumber: event.phoneNumber));

      response.fold(
        (failure) {
          emit(AuthFailure(failure.msg));
        },
        (verificationId) {
          if (verificationId == null) {
            emit(const AuthFailure('Failed to send OTP. Please try again.'));
          } else {
            emit(SmsOtpSentState(verificationId));
          }
        },
      );
    });

    on<UpdateTermsAndConditionsCheckboxEvent>((event, emit) {
      checkBoxValue = event.newValue;
      emit(CheckBoxUpdatedState(checkBoxValue));
    });
  }
}


//         super(AuthInitial()) {
//     // حدث تسجيل الحساب
//     on<AuthSingUp>(_handleSignUpEvent);

//     // حدث تسجيل الدخول
//     on<AuthSingIn>(_handleSignInEvent);

//     // حدث إرسال كود OTP
//     on<CodeSentEvent>(_handleCodeSentEvent);

//     // حدث تحديث قيمة Checkbox
//     on<UpdateTermsAndConditionsCheckboxEvent>(_handleCheckboxEvent);
//   }

//   // معالجة حدث تسجيل الحساب
//   Future<void> _handleSignUpEvent(
//       AuthSingUp event, Emitter<AuthState> emit) async {
//     emit(AuthLoading());
//     final response = await _userSignUp(UserSignUpParams(
//       id: event.id ?? '', // تأكد أن القيمة ليست null
//       name: event.name,
//       email: event.email,
//       phoneNumber: event.phoneNumber,
//       smsCode: event.smsCode ?? '', // تأكد أن القيمة ليست null
//     ));
//     response.fold(
//       (failure) => emit(AuthFailure(failure.msg)),
//       (success) => emit(AuthSuccess(success)),
//     );
//   }

//   // معالجة حدث تسجيل الدخول
//   Future<void> _handleSignInEvent(
//       AuthSingIn event, Emitter<AuthState> emit) async {
//     emit(AuthLoading());
//     final response = await _userSignIn(UserSignInParams(
//       phoneNumber: event.phoneNumber,
//       smsCode: event.smsCode ?? '', // تأكد أن القيمة ليست null
//     ));
//     response.fold(
//       (failure) => emit(AuthFailure(failure.msg)),
//       (success) => emit(AuthSuccess(success)),
//     );
//   }

//   // معالجة حدث إرسال كود OTP
//   Future<void> _handleCodeSentEvent(
//       CodeSentEvent event, Emitter<AuthState> emit) async {
//     emit(AuthLoading());
//     final response = await _smsOtp(SmsOtpParams(
//       phoneNumber: event.smsCode,
//     ));
//     response.fold(
//       (failure) => emit(AuthFailure(failure.msg)),
//       (verificationId) => emit(VerificationIdSentState(verificationId!)),
//     );
//   }

//   // معالجة حدث Checkbox
//   void _handleCheckboxEvent(
//       UpdateTermsAndConditionsCheckboxEvent event, Emitter<AuthState> emit) {
//     checkBoxValue = event.newValue;
//     emit(CheckBoxUpdatedState(checkBoxValue));
//   }
// }
