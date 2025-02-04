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

class SmsOtpVerifiedState extends AuthState {}

class AuthSuccess extends AuthState {
  final AppUser user;
  const AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}

class UserExistState extends AuthState {
  final AppUser user;
  const UserExistState(this.user);
}

class UserNotExistState extends AuthState {}

final class CheckBoxUpdatedState extends AuthState {
  final bool termsAndConditionsValue;
  const CheckBoxUpdatedState(this.termsAndConditionsValue);
}

final class CountryCodeUpdatedState extends AuthState {
  final String countryCode;
  const CountryCodeUpdatedState(this.countryCode);
}
