part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AppUser? user;

  const AuthSuccess(this.user);
}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);
}

final class AuthBlocLoggedOut extends AuthState {}

class SmsOtpSentState extends AuthState {
  final String verificationId;

  const SmsOtpSentState(this.verificationId);
}

class VerificationIdSentState extends AuthState {
  final String verificationId;

  const VerificationIdSentState(this.verificationId);

  List<Object?> get props => [verificationId];
}

final class CheckBoxUpdatedState extends AuthState {
  final bool termsAndConditionsValue;

  const CheckBoxUpdatedState(this.termsAndConditionsValue);
}
