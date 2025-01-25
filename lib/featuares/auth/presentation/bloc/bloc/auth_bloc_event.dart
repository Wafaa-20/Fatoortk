part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSingUp extends AuthEvent {
  final String id;
  final String name;
  final String email;
  final String phoneNumber;
  final String smsCode;

  AuthSingUp({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.smsCode,
  });
}
