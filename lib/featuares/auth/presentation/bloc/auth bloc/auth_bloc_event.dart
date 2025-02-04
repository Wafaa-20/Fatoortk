part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class SendSmsOtpEvent extends AuthEvent {
  final String phoneNumber;
  SendSmsOtpEvent({required this.phoneNumber});
}

final class VerifySmsOtpEvent extends AuthEvent {
  final String verificationId;
  final String smsCode;

  VerifySmsOtpEvent({required this.verificationId, required this.smsCode});
}

final class CacheUserDataEvent extends AuthEvent {
  final String name;
  final String email;
  final String phoneNumber;

  CacheUserDataEvent(
      {required this.name, required this.email, required this.phoneNumber});
}

final class CheckUserEvent extends AuthEvent {
  final String field, value;
  CheckUserEvent({required this.field, required this.value});
}

final class AuthSignUpEvent extends AuthEvent {
  final String verificationId;
  final String name;
  final String email;
  final String phoneNumber;
  final String smsCode;

  AuthSignUpEvent({
    required this.verificationId,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.smsCode,
  });
}

final class AuthSignInEvent extends AuthEvent {
  final String id;
  final String phoneNumber;
  final String smsCode;

  AuthSignInEvent(
      {required this.id, required this.phoneNumber, required this.smsCode});
}

final class UpdateTermsAndConditionsCheckboxEvent extends AuthEvent {
  final bool newValue;
  UpdateTermsAndConditionsCheckboxEvent(this.newValue);
}

final class UpdateCountryCodeEvent extends AuthEvent {
  final String countryCode;
  UpdateCountryCodeEvent({required this.countryCode});
}
