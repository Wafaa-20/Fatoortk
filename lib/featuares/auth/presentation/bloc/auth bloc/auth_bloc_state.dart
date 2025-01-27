part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  AuthState();
}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class SmsOtpSentState extends AuthState {
  final String verificationId;

  SmsOtpSentState(this.verificationId);
}

class AuthSuccess extends AuthState {
  final AppUser? user;

  AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;

  AuthFailure(this.message);
}

final class CheckBoxUpdatedState extends AuthState {
  final bool termsAndConditionsValue;

  CheckBoxUpdatedState(this.termsAndConditionsValue);
}
