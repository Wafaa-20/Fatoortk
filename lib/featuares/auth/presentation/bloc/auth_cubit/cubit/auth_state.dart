class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class CodeSent extends AuthState {
  final String verificationId;

  CodeSent({required this.verificationId});
}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure({required this.errorMessage});
}

final class AuthTimeout extends AuthState {}

final class CodeVerified extends AuthState {}
