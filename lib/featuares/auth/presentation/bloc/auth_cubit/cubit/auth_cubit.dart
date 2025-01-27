// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthInitial());

//   FirebaseAuth auth = FirebaseAuth.instance;
//   String? verificationId;
//   String? smsCode;

//   String? name;
//   String? email;
//   String? phoneNum;

//   String? countryCode;

//   bool? termsAndConditionsUpdatedCheckBoxValue = false;
//   GlobalKey<FormState> singupFormKey = GlobalKey();
//   GlobalKey<FormState> loginFormKey = GlobalKey();

//   singUpWithPhoneNumber() async {
//     try {
//       emit(AuthLoading());

//       await FirebaseAuth.instance.verifyPhoneNumber(
//         phoneNumber: phoneNum!,
//         timeout: const Duration(seconds: 60),
//         verificationCompleted: (PhoneAuthCredential credentia) async {
//           await auth.signInWithCredential(credentia);
//           emit(AuthSuccess());
//         },
//         verificationFailed: (FirebaseAuthException e) {
//           if (e.code == 'invalid-phone-number') {
//             emit(AuthFailure(errorMessage: 'Invalid phone number'));
//           } else if (e.code == 'credential-already-in-use') {
//             emit(AuthFailure(
//                 errorMessage: 'This phone number is already registered'));
//           } else {
//             emit(
//               AuthFailure(
//                   errorMessage:
//                       'Verification failed with error: ${e.message}.'),
//             );
//           }
//         },
//         codeSent: (String sentVerificationId, int? resendToken) async {
//           verificationId = sentVerificationId;
//           emit(CodeSent(verificationId: sentVerificationId));
//         },
//         codeAutoRetrievalTimeout: (String timeoutVerificationId) {
//           verificationId = timeoutVerificationId;
//           emit(AuthTimeout());
//         },
//       );
//     } catch (e) {
//       emit(AuthFailure(errorMessage: e.toString()));
//     }
//   }

//   signUpWithOtp(String smsCode) async {
//     if (verificationId == null) {
//       emit(AuthFailure(errorMessage: 'Verification id is null'));
//       return;
//     }

//     try {
//       emit(AuthLoading());

//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: verificationId!,
//         smsCode: smsCode,
//       );
//       await auth.signInWithCredential(credential);
//       emit(AuthSuccess());
//     } catch (e) {
//       emit(AuthFailure(errorMessage: 'Invalid OTP: $e'));
//     }
//   }

//   updateTermsAndConditionsCheckbox({required newValue}) {
//     termsAndConditionsUpdatedCheckBoxValue = newValue;
//     emit(TermsAndConditionsUpdateState());
//   }

//   updateSelectedCountryCode(String selectedCode) {
//     countryCode = selectedCode;
//     emit(CountryCodeUpdateState());
//   }
// }
