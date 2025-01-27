class AppUser {
  final String? id;
  final String name;
  final String email;
  final String phoneNumber;
  final String smsCode;

  AppUser(
      {this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.smsCode});
}
