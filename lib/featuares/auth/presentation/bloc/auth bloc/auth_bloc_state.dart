part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class SmsOtpSentState extends AuthState {
  final String verificationId;

  const SmsOtpSentState(this.verificationId);
}

class AuthSuccess extends AuthState {
  final String? user;
  const AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}

final class CheckBoxUpdatedState extends AuthState {
  final bool termsAndConditionsValue;
  const CheckBoxUpdatedState(this.termsAndConditionsValue);
}
