part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSingUpEvent extends AuthEvent {
  final String? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String? smsCode;

  AuthSingUpEvent({
    this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.smsCode,
  });
}

final class AuthSingInEvent extends AuthEvent {
  final String? id;
  final String phoneNumber;
  final String? smsCode;

  AuthSingInEvent({this.id, required this.phoneNumber, this.smsCode});
}

final class SendSmsOtpEvent extends AuthEvent {
  final String phoneNumber;

  SendSmsOtpEvent({required this.phoneNumber});
}

final class CodeVerifiedEvent extends AuthEvent {
  final String smsCode;
  CodeVerifiedEvent({required this.smsCode});
}

final class UpdateTermsAndConditionsCheckboxEvent extends AuthEvent {
  final bool newValue;
  UpdateTermsAndConditionsCheckboxEvent(this.newValue);
}
