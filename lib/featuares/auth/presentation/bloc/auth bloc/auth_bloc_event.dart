part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SendSmsOtpEvent extends AuthEvent {
  final String phoneNumber;

  SendSmsOtpEvent({required this.phoneNumber});
}

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
  final String id;
  final String phoneNumber;
  final String smsCode;

  AuthSingInEvent(
      {required this.id, required this.phoneNumber, required this.smsCode});
}

final class UpdateTermsAndConditionsCheckboxEvent extends AuthEvent {
  final bool newValue;
  UpdateTermsAndConditionsCheckboxEvent(this.newValue);
}
